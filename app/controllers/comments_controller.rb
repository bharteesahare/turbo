class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[:create]

  def create
    @post = Post.find( params[:post_id])
    @comment = @post&.comments&.build(comment_params)
    @comment.user = current_user
    @comment.save
    # if @comment.save
    #   redirect_to @post
    # else
    #   redirect_to @post, alert: "error"
    # end
  end

  private
  def set_post
    @post = Post.find( params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
