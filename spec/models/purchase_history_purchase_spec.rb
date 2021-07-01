require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_history_purchase = FactoryBot.build(:purchase_history_purchase, user_id: user.id, item_id: item.id)
    sleep(2)
  end

  describe '商品購入' do
    context '商品購入できる時' do
      it 'post_code,prefecture_id,city,address,phone_number,purchase_history_id,tokenが存在するとき購入できる' do
        expect(@purchase_history_purchase).to be_valid
      end
      it 'post_codeが３桁ハイフン4桁の半角文字列のとき購入できる' do
        @purchase_history_purchase.post_code = '234-5678'
        expect(@purchase_history_purchase).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @purchase_history_purchase.building = ''
        expect(@purchase_history_purchase).to be_valid
      end
      it 'phone_numberが10桁か11桁の半角数値のみのとき購入できる' do
        @purchase_history_purchase.phone_number = '0123456789'
        expect(@purchase_history_purchase).to be_valid
      end
    end
    context '商品購入できない時' do
      it 'post_codeが空のとき購入できない' do
        @purchase_history_purchase.post_code = ''
        @purchase_history_purchase.valid?
        expect(@purchase_history_purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが３桁ハイフン4桁の半角文字列でないとき購入できない' do
        @purchase_history_purchase.post_code = '1234567'
        @purchase_history_purchase.valid?
        expect(@purchase_history_purchase.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefecture_idが1のとき' do
        @purchase_history_purchase.prefecture_id = 1
        @purchase_history_purchase.valid?
        expect(@purchase_history_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空のとき購入できない' do
        @purchase_history_purchase.city = ''
        @purchase_history_purchase.valid?
        expect(@purchase_history_purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空のとき購入できない' do
        @purchase_history_purchase.address = ''
        @purchase_history_purchase.valid?
        expect(@purchase_history_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空のとき購入できない' do
        @purchase_history_purchase.phone_number = ''
        @purchase_history_purchase.valid?
        expect(@purchase_history_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下のとき購入できない' do
        @purchase_history_purchase.phone_number = '0123456'
        @purchase_history_purchase.valid?
        expect(@purchase_history_purchase.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numberが12桁以上のとき購入できない' do
        @purchase_history_purchase.phone_number = '012345678901'
        @purchase_history_purchase.valid?
        expect(@purchase_history_purchase.errors.full_messages).to include('Phone number is too long')
      end
      it 'phone_numberが半角数値以外のとき購入できない' do
        @purchase_history_purchase.phone_number = '１２３４５６７８９０'
        @purchase_history_purchase.valid?
        expect(@purchase_history_purchase.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'tokenが空のとき購入できない' do
        @purchase_history_purchase.token = ''
        @purchase_history_purchase.valid?
        expect(@purchase_history_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空のとき購入できない' do
        @purchase_history_purchase.user_id = ''
        @purchase_history_purchase.valid?
        expect(@purchase_history_purchase.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空のとき購入できない' do
        @purchase_history_purchase.item_id = ''
        @purchase_history_purchase.valid?
        expect(@purchase_history_purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
