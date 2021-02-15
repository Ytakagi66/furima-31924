class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/.freeze
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :password, format: { with: VALID_PASSWORD_REGEX }, confirmation: true, length: { minimum: 6 }
    validates :nickname
    with_options format: { with: VALID_NAME_REGEX } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: VALID_NAME_KANA_REGEX } do
      validates :last_name_kana
      validates :first_name_kana
    end
    validates :birthday
  end
end
