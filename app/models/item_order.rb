class ItemOrder

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id


  with_options presence: true do
    validates :prefecture_id, :city, :block, :phone_number, :post_code
  end

   validates :phone_number, format: { with: /\A\d{11}\z/ }
   validates :post_code, length: { is: 8 } 
   validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ } 
    

  def save
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building_name, phone_number: phone_number)
    Order.create(user_id: user_id, item_id: item_id)
  end
end