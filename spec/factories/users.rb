FactoryBot.define do

  factory :user do
    name      {"hide"}
    email     {"hide@gmail.com"}
    password  {"123456"}
    password_confirmation  {"123456"}
  end

end