class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:id])
    @comment = @blog.comments.new(comment_params)
    @comment.save
    redirect_to @blog
  end
  
  def destroy
  end
  
  private
    def comment_params
      params.require(:comment).permit(:commenter_id, :content)
    end
end
