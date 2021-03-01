class OrderShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :address, :building, :phone_number, :prefecture_id, :user_id, :item_id, :token


  VALID_POSTCODE_REGEX = /\A\d{3}-\d{4}\z/
  VALID_PHONENUMBER_REGEX = /\A\d{10,11}\z/

  with_options presence: true do
    validates :postal_code, format: { with: VALID_POSTCODE_REGEX }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_number, format: { with: VALID_PHONENUMBER_REGEX }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    # 購入の情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building,
                    phone_number: phone_number, order_id: order.id)
  end
end
