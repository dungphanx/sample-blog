class BlogsController < ApplicationController
  def index
    @blogs = Blog.all.lastest_blog.page params[:page]
    @hots = Comment.group(:blog).count.to_a.sort_by(&:last).reverse.take(10)
  end
  
  def create
    @blog = Blog.new blog_params
    if @blog.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def show
		@blog = Blog.find(params[:id])
	end
  
  private
  def blog_params
    params.require(:blog).permit(:title, :body, :creator_id)
  end
end
