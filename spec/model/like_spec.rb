require 'rails_helper'

describe Like, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @other = FactoryBot.create(:user)
    @tweet = @other.tweets.create
  end

  it "is valid with user and tweet" do
    like = Like.new(user: @user, tweet: @tweet)
    expect(like).to be_valid
  end

  it "is invalid with duplicate" do
    Like.create(user: @user, tweet: @tweet)
    like = Like.new(user: @user, tweet: @tweet)
    expect(like).not_to be_valid
  end

end
