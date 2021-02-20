class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  VALID_PRICE_REGEX = /\A[0-9]+\z/.freeze

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
    validates :price, format: { with: VALID_PRICE_REGEX },
                      numericality: { only_integer: true, greater_than: 299, less_than: 9_999_999 }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :scheduled
  belongs_to :shipping_fee
  belongs_to :status
end
