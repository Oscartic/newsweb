class CommentsController < ApplicationController
  before_action :set_notice, only: [:create, :destroy]

  def create
    @comment = @notice.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to @notice
  end

  def destroy
    @comment = @notice.comments.find(params[:id])
    @comment.destroy
    redirect_to @notice
  end

  private
    def set_notice
      @notice = Notice.find(params[:notice_id])
    end

    def comment_params
      params.require(:comment).permit(:name, :body, :notice_id)
    end
end
