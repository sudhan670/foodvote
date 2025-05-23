require "csv"
class Vote < ApplicationRecord
  validates :employee_id, presence: true, uniqueness: true, inclusion: { in: 1..150 }
  validates :check, presence: true, inclusion: { in: [ "yes", "no", "ab" ] }
  after_update :update_vote_count, if: :saved_change_to_check?
  has_many :comments, dependent: :destroy

  def self.search_by_employee_id(id)
    where(employee_id: id)
  end

  def format
    case check
    when "yes" then "Veg"
    when "no"  then "Non-Veg"
    else            "Absent"
    end
  end

  def self.to_csv
    total_count     = Vote.count
    veg_count       = Vote.where(check: "yes").count
    non_veg_count   = Vote.where(check: "no").count
    absent_count    = Vote.where(check: "ab").count

    attributes = %w[total_count veg_count non_veg_count absent_count]

    CSV.generate(headers: true) do |csv|
      csv << attributes
      csv << [ total_count, veg_count, non_veg_count, absent_count ]

      csv << []

      csv << [ "Employee ID", "Check" ]
      Vote.order(employee_id: :asc).each do |vote|
        csv << [ vote.employee_id, vote.format ]
      end
    end
  end

  private

  def update_vote_count
    vote_count = Vote.first
    return unless vote_count

    if check_previously_was.nil? && check.present?
      vote.total_count -= 1
      if check == "veg"
        vote_count.veg_count += 1
      elsif check == "non_veg"
        vote_count.non_veg_count += 1
      elsif check == "ab"
        vote_count.absent_count += 1
      end
      vote_count.save
    end
  end
end
