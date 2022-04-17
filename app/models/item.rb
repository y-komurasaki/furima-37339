class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user

  has_one_attached :image
  
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :prefecture_id
  belongs_to :shipping_date_id


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

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :user_id
    validates :category_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
  end  

end
