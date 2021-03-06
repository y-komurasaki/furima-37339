FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday { Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today) }

    japanese_user = Gimei.name

    first_name { japanese_user.first.kanji }
    first_name_kana { japanese_user.first.katakana }
    last_name { japanese_user.last.kanji }
    last_name_kana { japanese_user.last.katakana }
  end
end
