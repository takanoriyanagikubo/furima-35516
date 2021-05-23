FactoryBot.define do
  factory :delivery do

    postal_code              { "350-0821" }
    area_id                  { 3 }
    city                     { "品川区" }
    address                  { Faker::Address }
    building_name            { "" }
    phone_number             { "09012345678" }
    buy_id                   { 5 }
    token {"tok_abcdefghijk00000000000000000"}
  end

end

