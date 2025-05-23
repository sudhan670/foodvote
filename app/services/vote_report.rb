require "csv"
class VoteReport
  def self.generate_csv
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
end
