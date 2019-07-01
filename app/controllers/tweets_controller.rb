class TweetsController < ApplicationController

  # before_action :move_to_index, except: :index
  before_action :authenticate_user!, only: :new

  def index
    @tweets = Tweet.order("created_at DESC").page(params[:page]).per(6)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :image, :text).merge(user_id: current_user.id)
  end

  # def move_to_index
  #   redirect_to action: :index unless user_signed_in?
  # end
end
