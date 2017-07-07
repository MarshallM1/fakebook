Rails.application.routes.draw do
  get 'friendships/create'

  get 'friendships/update'

  get 'friendships/destroy'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  resources :users, :only => [:show, :index]
  resources :posts, :only => [:new, :destroy, :create, :show, :index]
  resources :friendships, only: [:create, :update, :destroy, :index]
  resources :likes, :only => [:create, :destroy]
  resources :comments, :only => [:create, :destroy]
end
