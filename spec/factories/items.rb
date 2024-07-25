FactoryBot.define do
  factory :item do
    association :user
    item_name { ' 服 ' }
    item_description { 'ジャケットです' }
    item_category_id   { Faker::Number.between(from: 2, to: 11) }
    item_condition_id  { Faker::Number.between(from: 2, to: 7) }
    shopping_fee_bearer_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    shopping_day_id { Faker::Number.between(from: 2, to: 4) }
    item_price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/comment.png'), filename: 'comment.png',
                        content_type: 'image/png')
    end
  end
end
