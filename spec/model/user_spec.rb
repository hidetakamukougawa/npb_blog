require 'rails_helper'
describe User do
  describe '#create' do

    it "is valid with a name, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid name 10文字以上" do
      user = build(:user, name: "hidehidehide")
      user.valid?
      expect(user.errors[:name]).to include("is too long (maximum is 10 characters)")
    end

    it "is valid name 10文字以下" do
      user = build(:user, name: "jinjinhide")
      expect(user).to be_valid
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with a duplicate name" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:name]).to include("has already been taken")
    end

    it "is valid password 6文字以上" do
      user = build(:user, password: "123456")
      expect(user).to be_valid
    end

    it "is invalid password 5文字以下" do
      user = build(:user, password: "12345")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

  end
end