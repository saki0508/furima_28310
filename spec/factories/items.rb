FactoryBot.define do
  factory :item do
    name {'時計'}
    description {'丈夫な時計です'}
    price {500}
    category_id {3}
    state_id {3}
    postage_id {3}
    region_id {3}
    shipping_date_id {3}
    association :user
  end
end
