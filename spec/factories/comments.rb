FactoryBot.define do

  factory :comment do
    text      {"逆方向にそこまで飛ばすか！？"}
    user
    tweet
  end

end