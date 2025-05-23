class CsvMailer < ApplicationMailer
  default to: ["sudhandurai670@gmail.com", "sudhaned08@gmail.com"], from: "sudhaned123@gmail.com"

  def send_weekly_report
    attachments["weekly_vote_report.csv"] = {
      mime_type: "text/csv",
      content: VoteReport.generate_csv
    }

    mail(
      subject: "Weekly Food Vote Report",
      body: "Please find the attached weekly food vote report."
    )
  end
end
