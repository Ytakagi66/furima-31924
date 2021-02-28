FactoryBot.define do
  factory :order_shipping do
    postal_code   { "123-4567" }
    prefecture_id { 1 }
    city          { '市町村' }
    address       { '青山1-1-1' }
    building      { '建物名' }
    phone_number  { 1234567890 }
    number        { 4242424242424242 }
    exp_month     { 3 }
    exp_year      { 23 }
    cvc           { 123 }
  end
end