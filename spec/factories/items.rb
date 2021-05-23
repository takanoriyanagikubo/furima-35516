FactoryBot.define do
  factory :item do

    item_name           {Faker::Lorem.sentence}
    description         {Faker::Lorem.sentence}
    category_id         { 2 }
    status_id           { 2 }
    deliverry_charge_id { 3 }
    area_id             { 47 }
    day_id              { 2 }
    price               { 1000 }
    id                  {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/tes.png'), filename: 'tes.png')
    end

  end
end
