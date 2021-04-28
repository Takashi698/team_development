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

    def show
    end

    def edit
    end

    def update
      if @blog.update(blog_params)
        redirect_to blogs_path, notice: "ブログを編集しました！"
      else
        render :edit
      end
    end

    def destroy
      @blog.destroy
      redirect_to blogs_path, notice:"ブログを削除しました！"
    end

    def confirm
      @blog = Blog.new(blog_params)
      render :new if @blog.invalid?
    end

    private

    def blog_params
      params.require(:blog).permit(:image, :image_cache, :content)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end
  end