class CommentsController < ApplicationController
  before_action :set_commentable

  def index
  end

  def create
    @comment = Comment.create(comment_params)
  end

  private

  def set_commentable
    @commentable = GlobalID::Locator.locate_signed(params[:commentable])
  end

  def comment_params
    params.require(:comment).permit(:body).merge(commentable: @commentable)
  end
end
