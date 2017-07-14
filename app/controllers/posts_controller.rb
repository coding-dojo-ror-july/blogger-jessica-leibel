class PostsController < ApplicationController
  def new
    @blog_id = params[:blog_id]
  end
  def create
    post = Post.new(blog_id: params[:blog_id], title: post_params[:title], content: post_params[:content])
    if post.save
      redirect_to "/blogs/#{ params[:blog_id] }/show"
    else
      flash[:errors] = post.errors.full_messages
      redirect_to "/blogs/#{ params[:blog_id] }/new"
    end
  end
  def show
    @post = Post.find(params[:post_id])
    render 'show'
  end   
end
private
  def post_params
    params.require(:post).permit(:title, :content)
  end  