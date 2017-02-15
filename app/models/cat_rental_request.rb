# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :text             not null
#  created_at :datetime
#  updated_at :datetime
#

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :valid_status, :no_overlaps

  after_initialize :set_default

  VALID_STATUSES = %w(PENDING APPROVED DENIED)

  belongs_to :cat

  private
  def valid_status
    unless VALID_STATUSES.include?(self.status)
      errors[:status] << "Invalid status: #{self.status}."
    end
  end

  def set_default
    self.status ||= "PENDING"
  end

  def no_overlaps
    unless overlapping_approved_requests.empty?
      errors[:request] << "Cat already rented during this period."
    end
  end

  def overlapping_approved_requests
    CatRentalRequest.find_by_sql(<<-SQL)
      SELECT
        *
      FROM
        cat_rental_requests
      WHERE
        #{self.cat_id} = cat_id AND
        status = 'APPROVED' AND (
          #{self.start_date} < end_date OR
          start_date < #{self.end_date}
        )
      SQL
  end
end
