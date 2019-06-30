class TweetsController < ApplicationController
  def index
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
end
