class Item < ApplicationRecord
  belongs_to :user

  VALID_PRICE_REGEX = /\A[0-9]+\z/.freeze

  validates :name, :info, :price, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id, format: { with: VALID_PRICE_REGEX },numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }
    validates :prefecture_id
    validates :scheduled_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions do
  has_many :category
  has_many :prefecture
  has_many :scheduled
  has_many :shipping_fee
  has_many :status
  has_one_attached :image
  end
end
