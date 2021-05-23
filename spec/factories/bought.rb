FactoryBot.define do
  factory :bought do

    postal_code              { "350-0821" }
    area_id                  { 3 }
    city                     { "品川区" }
    address                  { Faker::Address }
    building_name            { "" }
    phone_number             { "09012345678" }
    buy_id                   { 5 }
    token                    {"tok_abcdefghijk00000000000000000"}
    item_id                  { 5 }
    user_id                  { 5 }
  end

end
