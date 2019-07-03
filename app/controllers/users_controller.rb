class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.page(params[:page]).per(6).order("created_at DESC")
  end
end
