class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    # validates :email,    format: { with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
    validates :password, format: { with: VALID_PASSWORD_REGEX}, confirmation: true, length: { minimum: 6 }
    validates :nickname 
    with_options format: {with: VALID_NAME_REGEX} do
      validates :last_name
      validates :first_name
    end
    with_options format: {with: VALID_NAME_KANA_REGEX} do
      validates :last_name_kana
      validates :first_name_kana
    end
    validates :birthday
  end
end
