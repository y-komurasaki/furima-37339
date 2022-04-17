class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :user_id
    validates :name
    validates :info
    validates :category_id
    validates :sipping_cost_id
    validates :prefecture_id
    validates :sipping_date_id
    validates :price
end
