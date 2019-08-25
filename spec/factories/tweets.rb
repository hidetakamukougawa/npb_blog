# frozen_string_literal: true

FactoryBot.define do
  factory :tweet do
    title      { '柳田すごすぎ' }
    text       { 'パワーありすぎ！！' }
    after(:build) do |tweet|
      tweet.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'htmlcss.jpg')), filename: 'htmlcss.jpg', content_type: 'image/jpeg')
    end
    user
  end
end
