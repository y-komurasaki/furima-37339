require 'rails_helper'

RSpec.describe ItemOrder, type: :model do

  before do
    @item_order = FactoryBot.build(:item_order)
  end

  describe '購入者情報の登録' do

    context '新規登録がうまくいくとき' do

      it '全ての項目が正しく入力されてあれば登録できる' do
        expect(@item_order).to be_valid
      end

    end

    context '新規登録がうまくいかないとき' do
      it 'post_codeが空では登録されない' do
        @item_order.post_code = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeにハイフンがないと登録できない' do
        @item_order.post_code = "12345678"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Post code is invalid")
      end

      it 'post_codeが8桁でないと購入できない' do
        @item_order.post_code = "123-45678"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Post code is invalid", "Post code is the wrong length (should be 8 characters)")
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
        @item_order.phone_number = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁でなければ購入できない' do
        @item_order.phone_number = "080123456789"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end


    end
  end
end