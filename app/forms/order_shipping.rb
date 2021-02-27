class OrderShipping
  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :postal_code, :city, :address, :building, :phone_number, :prefecture,
   :user_id, :item_id
  
  with_options presence: true do
    validates :number
    validates :cvc
    validates :exp_month
    validates :exp_year
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture
    validates :city
    validates :address
    validates :building
    validates :phone_number
  end

  def save
    # 購入の情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    binding.pry
    # 住所の情報を保存
    Shipping.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, 
      phone_number: phone_number, order_id: order.id)
  end
end