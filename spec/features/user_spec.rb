# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User', type: :feature do
  let(:user) { create(:user) }

  scenario 'new user register' do
    visit new_user_registration_path
    fill_in 'name', with: user.name
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    fill_in 'password_confirmation', with: user.password
    click_button '登録する'
    expect(page).to have_content 'ログイン'
  end

  scenario 'invalid user register' do
    visit new_user_registration_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    fill_in 'password_confirmation', with: user.password
    click_button '登録する'
    expect(page).to have_content "Name can't be blank"
  end

  scenario 'user session' do
    visit new_user_session_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'ログイン'
    expect(page).to have_content '投稿する'
  end

  scenario 'invalid user session' do
    visit new_user_session_path
    fill_in 'email', with: user.email
    click_button 'ログイン'
    expect(page).to have_no_content '投稿する'
  end
end
