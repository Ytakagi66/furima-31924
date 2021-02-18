FactoryBot.define do
  factory :item do
    association :user
    name            { '商品' }
    info            { '説明' }
    price           { '400' }
    category_id     { '1' }
    status_id       { '1' }
    shipping_fee_id { '1' }
    prefecture_id   { '1' }
    scheduled_id    { '1' }
  end
end
