# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#create' do
    before do
      @user = create(:user)
      @other = create(:user)
      @tweet = @other.tweets.create
    end

    it 'is valid with user and tweet' do
      like = Like.new(user: @user, tweet: @tweet)
      expect(like).to be_valid
    end

    it 'is invalid with duplicate' do
      Like.create(user: @user, tweet: @tweet)
      like = Like.new(user: @user, tweet: @tweet)
      expect(like).not_to be_valid
    end
  end
end
