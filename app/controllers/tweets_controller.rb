class TweetsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  before_action :set_tweet, only: [:show, :edit]

  def index
    @q = Tweet.ransack(params[:q])
    @tweets = @q.result(distinct: true).order("created_at DESC").page(params[:page]).per(6)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    redirect_to root_path
  end

  def edit
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

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
      redirect_to root_path, notice: "削除に成功しました。"
    else
      redirect_to root_path, notice: "削除に失敗しました。"
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :image, :text).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
