require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe '#create' do
    context 'can save' do
  
      it "is valid with a title, text, image" do
        tweet = build(:tweet)
        expect(tweet).to be_valid
      end
    
    end

    context 'can not save' do

      it "is invalid without a title" do
        tweet = build(:tweet, title: "")
        tweet.valid?
        expect(tweet.errors[:title]).to include("can't be blank")
      end

      it "is invalid without a text" do
        tweet = build(:tweet, text: "")
        tweet.valid?
        expect(tweet.errors[:text]).to include("can't be blank")
      end

      it "is valid title 20文字以内" do
        tweet = build(:tweet, title: "柳田かっこよすぎ！！！")
        expect(tweet).to be_valid
      end

      it "is invalid title 20文字以上" do
        tweet = build(:tweet, title: "柳田かっこよすぎ！！！柳田かっこよすぎ！！！柳田かっこよすぎ！！！")
        tweet.valid?
        expect(tweet.errors[:title]).to include("is too long (maximum is 20 characters)")
      end

      it "is invalid without user_id" do
        tweet = build(:tweet, user_id: nil)
        tweet.valid?
        expect(tweet.errors[:user]).to include("can't be blank")
      end

    end
  end
end
