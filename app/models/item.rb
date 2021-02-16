class Item < ApplicationRecord
  belongs_to :user

  VALID_PRICE_REGEX = /\A[0-9]+\z/.freeze
  
  validates :name, :info, :price, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions do
  belongs_to :category
  belongs_to :prefecture
  belongs_to :scheduled
  belongs_to :shipping_fee
  belongs_to :status
  end
end
