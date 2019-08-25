# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  # resources :tweets, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
  resources :tweets do
    resources :comments, only: %i[new create]
    resources :likes, only: %i[create destroy]
  end
  resources :users, only: %i[index show]
end
