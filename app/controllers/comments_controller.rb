class CommentsController < ApplicationController
before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create

    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to posts_url}
        format.json { render json: @resource }
      end
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
    def set_comment
      @comment = Post.find(params[:id])
    end
    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
    end

end
