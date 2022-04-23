class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user

  has_one_attached :image
  
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date


  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price
  end  

  with_options format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { greater_than: 300, less_than: 9999999 } 
    validates :price, numericality: { only_integer: true }
  end

  with_options numericality: { other_than: 0 , message: "can't be blank"} do
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
  end  

end
