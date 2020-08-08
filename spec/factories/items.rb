FactoryBot.define do
  factory :item do
    name {Faker::Lorem.word}
    description {Faker::Lorem.sentences}
    price {Faker::Number.number(digits: 4)}
    category_id {Faker::Number.within(range: 2..11)}
    state_id {Faker::Number.within(range: 2..7)}
    postage_id {Faker::Number.within(range: 2..3)}
    region_id {Faker::Number.within(range: 2..48)}
    shipping_date_id {Faker::Number.within(range: 2..4)}
    association :user
  end
end
