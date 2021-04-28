class BlogsController < ApplicationController
  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def index
    @blogs = Blog.all
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "投稿を作成しました！"
      else
        render :new
      end
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:image, :image_cache, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end