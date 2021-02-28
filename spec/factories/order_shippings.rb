FactoryBot.define do
  factory :order_shipping do
    postal_code   { '123-4567' }
    prefecture_id { 1 }
    city          { '市町村' }
    address       { '青山1-1-1' }
    building      { '建物名' }
    phone_number  { 12_345_678_900 }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
