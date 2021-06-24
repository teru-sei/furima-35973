require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品の出品ができるとき' do
      it 'image,item_name,item_description,category_id,condition_id,delivery_price_id,delivery_day_id,prefecture_id,item_priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'item_priceが300~9999999の半角数値のみなら登録できる' do
        item_price = '100000'
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができないとき' do
      it 'imageが空のとき' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空のとき' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_descriptionが空のとき' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'category_idが1のとき' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが1のとき' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'delivery_price_idが1のとき' do
        @item.delivery_price_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery price can't be blank")
      end
      it 'delivery_day_idが1のとき' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'prefecture_idが1のとき' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'item_priceが空のとき' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_priceが300~9999999でないとき' do
        @item.item_price = '100000000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is out of setting range")
      end
    end    
  end
end