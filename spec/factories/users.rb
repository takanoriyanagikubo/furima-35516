FactoryBot.define do
  factory :user do

    nick_name             { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            {"田中"}
    last_name             {"太郎"}
    first_name_kana       { "カナ" }
    last_name_kana        {"タロウ"}
    birthday              {"1971-05-08"}
    id                    {1}
  end
end