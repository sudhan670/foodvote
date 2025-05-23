require "csv"
class VotesController < ApplicationController
  before_action :set_vote, only: %i[show edit update destroy]

  def index
      @veg_count = Vote.where(check: "yes").count
      @non_veg_count = Vote.where(check: "no").count
      @absent_count = Vote.where(check: "ab").count
      @total_count = Vote.count
      @missed_count = 150 - (@veg_count + @non_veg_count + @absent_count)
      @vote = Vote.new
      @votes =Vote.all.page(params[:page]).per(20)

      respond_to do |format|
        format.html
        format.csv { send_data generate_csv(@votes), filename: "votes-#{Date.today}.csv" }
      end

      if params[:employee_id].present?
        @votes = Vote.search_by_employee_id(params[:employee_id]).order(:employee_id)
      else
        @votes = Vote.order(:employee_id)
      end
      @votes = @votes.page(params[:page]).per(20)
  end

  def export
    send_data Vote.to_csv, filename: "votes-#{Date.today}-#{Date.today.strftime('%A')}.csv"
  end

  def show
    @vote = Vote.find(params[:id])
  end

  def send_csv
      CsvMailer.send_weekly_report.deliver_now
      Rails.logger.info "CSV mail sent!"
      redirect_to votes_path, notice: "CSV report is being sented."
  end

  def new
    @vote = Vote.new
  end

  def edit
    @vote = Vote.find(params[:id])
    @votes = Vote.all
  end

  def create
    unless voting_open?
      redirect_to @votes, alert: "Voting is allowed only between 9:00 AM to 1:00 PM."
      return
    end
    @vote = Vote.new(vote_params)
    if @vote.save
      redirect_to @vote, notice: "Vote submitted successfully!"
    else
      puts @vote.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def update
    unless voting_open?
      redirect_to votes_path, alert: "Voting is closed after 1:00 PM."
      return
    end

    if @vote.update(vote_params)
      redirect_to @vote, notice: "Vote was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @vote.destroy!
    redirect_to votes_path, status: :see_other, notice: "Vote was successfully destroyed."
  end

  private
    def voting_open?
      now = Time.zone.now
      # return false unless now.tuesday?
      start_time = now.change(hour: 9, min: 0)
      end_time = now.change(hour: 20, min: 0)
      now >= start_time && now <= end_time
    end

    def set_vote
      @vote = Vote.find(params[:id])
    end

    def vote_params
      params.require(:vote).permit(:employee_id, :check)
    end
end
