# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/tweets/#{comment.tweet.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(tweet_id: params[:tweet_id], user_id: current_user.id)
  end
end
