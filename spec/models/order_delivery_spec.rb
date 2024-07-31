require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_delivery = FactoryBot.build(:order_delivery, user_id: user.id, item_id: item.id)
  end
  describe '購入情報の保存' do
    context '購入できる時' do
      it 'postal_code,prefecture_id,city,address,building_name,phone_number,user_id,item_id,tokenが存在していれば購入できる' do
        expect(@order_delivery).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @order_delivery.building_name = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '購入できない時' do
      it 'postal_codeが空だと購入できない' do
        @order_delivery.postal_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @order_delivery.postal_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが「4桁以上ハイフン4桁」では購入できない' do
        @order_delivery.postal_code = '1234-5678'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが「3桁ハイフン5桁以上」では購入できない' do
        @order_delivery.postal_code = '123-45678'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが「3桁未満ハイフン4桁」では購入できない' do
        @order_delivery.postal_code = '12-3456'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが「3桁ハイフン4桁未満」では購入できない' do
        @order_delivery.postal_code = '123-456'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'cityが空だと購入できない' do
        @order_delivery.city = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できない' do
        @order_delivery.address = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order_delivery.phone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは10桁未満だと購入できない' do
        @order_delivery.phone_number = '123456789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Phone number is invalid. Input half-width characters.')
      end
      it 'phone_numberは12桁以上だと購入できない' do
        @order_delivery.phone_number = '123456789012'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Phone number is invalid. Input half-width characters.')
      end
      it 'phone_numberは半角数値以外だと購入できない' do
        @order_delivery.phone_number = '１２３４５６７８９０'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Phone number is invalid. Input half-width characters.')
      end
      it 'user_idが空だと購入できない' do
        @order_delivery.user_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @order_delivery.item_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @order_delivery.token = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
