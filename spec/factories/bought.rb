FactoryBot.define do
  factory :bought do

    postal_code              { "350-0821" }
    area_id                  { 3 }
    city                     { "品川区" }
    address                  { Faker::Address }
    building_name            { "品川ビル" }
    phone_number             { "09012345678" }
    token                    {"tok_abcdefghijk00000000000000000"}

  end

end
