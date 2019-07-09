require 'rails_helper'
describe Comment do
  describe '#create' do
    
    it "is valid with a text" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "is invalid without a text" do
      comment = build(:comment, text: "")
      comment.valid?
      expect(comment.errors[:text]).to include("can't be blank")
    end

    it "is invalid without user_id" do
      comment = build(:comment, user_id: nil)
      comment.valid?
      expect(comment.errors[:user]).to include("can't be blank")
    end

    it "is invalid without tweet_id" do
      comment = build(:comment, tweet_id: nil)
      comment.valid?
      expect(comment.errors[:tweet]).to include("can't be blank")
    end
  
  end
end
