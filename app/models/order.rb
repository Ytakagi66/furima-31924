class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :shipping

  include ActiveModel::Model
  attr_accessor :number, :cvc, :exp_month, :exp_year, :postal_code, :prefecture, :city, :address, :building, :phone_number
  
  with_options presence: true do
    validates :number
    validates :cvc
    validates :exp_month
    validates :exp_year
    validates :postal_code
    validates :prefecture
    validates :city
    validates :address
    validates :building
    validates :phone_number
  end

end
