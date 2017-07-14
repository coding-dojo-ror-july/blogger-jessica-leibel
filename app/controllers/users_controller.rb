class UsersController < ApplicationController

  def signin
  end

  def create
    #render json: [registration_params, create_blog_params] 
    user = User.new(registration_params)
    blog = Blog.new(user: user, title: create_blog_params[:title])
    if user.valid? && blog.valid?
      user.save
      blog.save
      session[:user_id] = user.id
      redirect_to '/'
    else 
      flash[:errors] = user.errors.full_messages  
      flash[:errors] += blog.errors.full_messages  
    end
  end

  def authenticate
    user = User.find_by(username: login_params[:username])
    if user.nil?
      flash[:errors] = ['User not found']
      redirect_to '/signin'
    elsif user.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:errors] = ['Incorrect Password']
      redirect_to '/signin'
    end
  end

  def signout
    reset_session
    redirect_to '/'
  end

private

  def registration_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
  
  def create_blog_params
    params.require(:blog).permit(:title)
  end   

  def login_params
    params.require(:user).permit(:username, :password)
  end

end
