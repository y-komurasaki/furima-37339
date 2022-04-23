require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do

    context '新規登録がうまくいくとき' do
      it '全ての項目が正しく入力されてあれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空では登録されない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'infoが空では登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end


      it 'category_idで0が選択された場合は登録されない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'item_status_idで0が選択された場合は登録されない' do
        @item.item_status_id  = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end

      it 'shipping_cost_idで0が選択された場合は登録されない' do
        @item.shipping_cost_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it 'prefecture_idで0が選択された場合は登録されない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipping_date_idで0が選択された場合は登録されない' do
       @item.shipping_date_id = '0'
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping date can't be blank")
     end


      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが半角数字以外では登録できない' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが300より少ないと登録できない' do
        @item.price = "50"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it 'priceが9999999より多いと登録できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
  
  
    end
  end
end
