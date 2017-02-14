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
  validate :valid_color, :valid_sex

  VALID_COLORS = %w(black purple marmalade tortoishell tabby white grey)

  def age
    Time.now.year - self.birth_date.year
  end

  private
  def valid_color
    unless VALID_COLORS.include?(self.color)
      errors[:color] << "Cats can't be #{self.color}."
    end
  end

  def valid_sex
    unless ["M", "F"].include?(self.sex)
      errors[:sex] << "Cats can't be #{self.sex}."
    end
  end
end
