# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validate :valid_color

  VALID_COLORS = %s(black purple marmalade tortoishell tabby white grey)

  private
  def valid_color
    unless VALID_COLORS.include?(@color)
      errors[:color] << "Cat's can't be #{@color}"
    end
  end
end
