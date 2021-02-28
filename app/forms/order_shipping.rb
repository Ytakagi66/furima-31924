class OrderShipping
  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :postal_code, :city, :address, :building, :phone_number, :prefecture_id,
   :user_id, :item_id
  
   VALID_POSTCODE_REGEX = /\A\d{3}[-]\d{4}\z/
   VALID_PHONENUMBER_REGEX = /\A\d{10}\z/
   
  with_options presence: true do
    validates :number
    validates :cvc
    validates :exp_month
    validates :exp_year
    validates :postal_code, format: {with: VALID_POSTCODE_REGEX}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :building
    validates :phone_number, format: {with: VALID_PHONENUMBER_REGEX}
  end

  def save
    # 購入の情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, 
      phone_number: phone_number, order_id: order.id)
  end
end