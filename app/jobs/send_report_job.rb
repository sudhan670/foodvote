require "csv"
class SendReportJob < ApplicationJob
  queue_as :default

  def perform
    csv_data = generate_csv
    CsvMailer.weekly_vote_report(csv_data).deliver_now
  end

  private

  def generate_csv
    CSV.generate(headers: true) do |csv|
      csv << [ "ID", "Food Choice", "Created At" ]

      Vote.all.each do |vote|
        csv << [ vote.employee_id, check(vote.check), vote.created_at ]
      end
    end
  end
end
