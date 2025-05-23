namespace :votes do
  desc "Send food vote report email to HR"
  task send_report: :environment do
    puts "[#{Time.now}] Sending vote report to HR..."
    CsvMailer.send_weekly_report.deliver_now
    puts "[#{Time.now}] Report sent!"
  end
end
