require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)

    @item_order = FactoryBot.build(:item_order, user_id: user.id, item_id: item.id)


  end

  describe '購入者情報の登録' do
    context '新規登録がうまくいくとき' do
      
      it '全ての項目が正しく入力されてあれば登録できる' do
        expect(@item_order).to be_valid
      end

      it 'buildingがなくても登録できること' do
        @item_order.building = ''
        expect(@item_order).to be_valid
      end
    

    end

    context '新規登録がうまくいかないとき' do
      it 'tokenが空だと購入ができない' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空では登録されない' do
        @item_order.post_code = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeにハイフンがないと登録できない' do
        @item_order.post_code = '12345678'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Post code is invalid')
      end

      it 'post_codeが8桁でないと購入できない' do
        @item_order.post_code = '123-45678'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Post code is the wrong length (should be 8 characters)')
      end

      it 'prefecture_idで0が選択された場合は登録されない' do
        @item_order.prefecture_id = '0'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では登録されない' do
        @item_order.city = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空では登録されない' do
        @item_order.block = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @item_order.phone_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下では購入できない' do
        @item_order.phone_number = '08012345'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが12桁以上では購入できない' do
        @item_order.phone_number = '0801234567890'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが半角数字以外が含まれている場合は購入できない' do
        @item_order.phone_number = '080123456789abc'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is invalid')
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end

      it 'アイテムが紐付いていなければ投稿できない' do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end


    end
  end
end
