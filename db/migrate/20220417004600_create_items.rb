class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,         null: false, foreign_key: true
      t.strig :name,              null: false
      t.text :info,               null: false
      t.integer :category_id,     null: false
      t.integer :item_status_id,  null: false
      t.integer :sipping_cost_id, null: false
      t.integer :prefecture_id,   null: false
      t.integer :sipping_date_id, null: false
      t.integer :price,           null: false
      
      t.timestamps
    end
  end
end