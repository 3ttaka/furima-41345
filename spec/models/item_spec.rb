require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do
    context '保存できる時' do
      it 'item_name,item_description,item_category_id,item_condition_id,shopping_fee_bearer_id,prefecture_id,shopping_day_id,item_price,user_id,imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '保存できない時' do
      it 'item_nameが空では保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_descriptionが空では保存できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'item_category_idが初期値では保存できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item_condition_idが初期値では保存できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it 'shopping_fee_bearer_idが初期値では保存できない' do
        @item.shopping_fee_bearer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping fee bearer can't be blank")
      end
      it 'prefecture_idが初期値では保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shopping_day_idが初期値では保存できない' do
        @item.shopping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping day can't be blank")
      end
      it 'item_priceが空では保存できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'user_idが空では保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_priceは¥300以下だと保存できない' do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid')
      end
      it 'item_priceは¥9,999,999以上だと保存できない' do
        @item.item_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid')
      end
      it 'item_priceは半角数値以外では保存できない' do
        @item.item_price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid')
      end
    end
  end
end
