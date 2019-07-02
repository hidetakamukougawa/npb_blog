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

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
      redirect_to root_path, notice: "投稿を更新しました。"
    else
      redirect_to root_path, notice: "更新に失敗しました。"
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :image, :text).merge(user_id: current_user.id)
  end

  # def move_to_index
  #   redirect_to action: :index unless user_signed_in?
  # end
end
