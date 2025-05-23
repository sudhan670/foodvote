class CommentsController < ApplicationController
  before_action :set_vote

  def create
    @comment = @vote.comments.new(comment_params)
    if @comment.save
      redirect_to vote_path(@vote), notice: "Comment saved successfully"
    else
      redirect_to vote_path(@vote), alert: "Failed to save comment"
    end
  end

  private

  def set_vote
    @vote = Vote.find(params[:vote_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
