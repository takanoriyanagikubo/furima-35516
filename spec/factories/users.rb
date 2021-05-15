FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    
    
    nick_name             { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password              { password }
    password_confirmation { password }
    first_name            {Faker::Name.first_name}
    last_name             {Faker::Name.last_name}
    first_name_kana       { person.first.katakana }
    last_name_kana        { person.last.katakana }
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end