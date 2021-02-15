class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validatable :
  end
end
