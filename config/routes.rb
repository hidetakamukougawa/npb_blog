Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  # resources :tweets, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
  resources :tweets do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show]
end
