FactoryBot.define do
  factory :address do
    postal_code {'123-4567'}
    prefecture_id {2}
    city {'札幌市'}
    block {'青山1丁目'}
    building {'田中ビル'}
    phone_number {'01234567892'}
    association :item
  end
end
