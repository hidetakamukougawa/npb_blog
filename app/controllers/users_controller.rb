class UsersController < ApplicationController

  def index
    @users = User.order("created_at DESC").page(params[:page]).per(9)
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.page(params[:page]).per(6).order("created_at DESC")
  end
end
