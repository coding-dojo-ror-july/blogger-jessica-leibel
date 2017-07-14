class BlogsController < ApplicationController
  def index
    if session.key?(:user_id)
      @user = User.find(session[:user_id])
      @user_blog = @user.blog
      @blogs = Blog.all
    end
  end
  def show
    @user_blog = Blog.find(params[:blog_id])
    @posts = @user_blog.posts
    render "show"
  end  
end
