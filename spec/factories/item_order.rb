FactoryBot.define do
  factory :item_order do
    post_code             { '123-4567' }
    prefecture_id         { Faker::Number.between(from: 1, to: 47) }
    city                  { '東京都' }
    block                 { '1-1-1' }
    phone_number          { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
