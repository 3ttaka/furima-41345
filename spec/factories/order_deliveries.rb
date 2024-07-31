FactoryBot.define do
  factory :order_delivery do
    postal_code              { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id            { Faker::Number.between(from: 2, to: 48) }
    city                     { Faker::Address.city }
    address                  { Faker::Address.street_address }
    building_name            { Faker::Address.secondary_address }
    phone_number             { Faker::Number.number(digits: [10, 11].sample).to_s }
    user_id                  { 1 }
    item_id                  { 1 }
    token                    { 'tok_abcdefghijk00000000000000000' }
  end
end
