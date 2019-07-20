require 'rails_helper'

RSpec.feature "Tweet", type: :feature do
  
  include_examples :sign_in
  
  scenario 'create new tweet' do
    expect do
      visit new_tweet_path
      fill_in "title", with: "タイトル"
      attach_file 'tweet[image]', "#{Rails.root}/spec/factories/images/htmlcss.jpg"
      fill_in "text", with: "テキスト"
      click_button "投稿する"
    end.to change(Tweet, :count).by(1)
  end

  scenario 'create invalid tweet' do
    expect do
      visit new_tweet_path
      fill_in "title", with: "タイトル"
      fill_in "text", with: "テキスト"
      click_button "投稿する"
    end.to change(Tweet, :count).by(0)
  end

end