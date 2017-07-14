Rails.application.routes.draw do

  root 'blogs#index'

  # user routes
  get 'signin' => 'users#signin'
  get 'signout' => 'users#signout'
  post 'users' => 'users#create'
  post 'users/authenticate' => 'users#authenticate'

  # blog article/post routes




  get 'blogs/:blog_id/posts/new' => 'posts#new'
  post 'blogs/:blog_id/posts' => 'posts#create'
  get 'blogs/:blog_id/show' => 'blogs#show'
  get 'blogs/:blog_id/posts/:post_id/show' => 'posts#show'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
