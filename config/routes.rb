Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  resources :users, :only => [:show, :index]
  resources :posts, :only => [:new, :destroy, :create, :show]
end
