Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets, only: [:index, :new, :create, :edit, :update, :show] do
    resources :comments, only: [:new, :create]
  end
end
