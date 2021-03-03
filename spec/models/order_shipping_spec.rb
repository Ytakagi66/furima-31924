require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    @user_id = FactoryBot.create(:user)
    @item_id = FactoryBot.create(:item)
    @ordershipping = FactoryBot.build(:order_shipping)
    @ordershipping.user_id = @user_id
    @ordershipping.item_id = @item_id
  end

  describe '購入機能' do
    describe '商品購入できる時' do
      it 'カード情報と住所情報を適切に入力すると、商品の購入ができる' do
        expect(@ordershipping).to be_valid
      end
      it '建物情報がなくても商品の購入ができる' do
        @ordershipping.building = nil
        expect(@ordershipping).to be_valid
      end
    end

    describe '商品購入できない時' do
      it '配送先の情報として、郵便番号がなければ購入できない' do
        @ordershipping.postal_code = nil
        @ordershipping.valid?
        expect(@ordershipping.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
      end
      it '郵便番号にはハイフンがないと購入できない（123-4567となる）' do
        @ordershipping.postal_code = '1234567'
        @ordershipping.valid?
        expect(@ordershipping.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号が1234-567の形だと購入できない' do
        @ordershipping.postal_code = '1234-567'
        @ordershipping.valid?
        expect(@ordershipping.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号に数字以外が含まれていると購入できない' do
        @ordershipping.postal_code = '1234&567'
        @ordershipping.valid?
        expect(@ordershipping.errors.full_messages).to include('Postal code is invalid')
      end
      it '配送先の情報として、都道府県がなければ購入できない' do
        @ordershipping.prefecture_id = 0
        @ordershipping.valid?
        expect(@ordershipping.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '配送先の情報として、市区町村がなければ購入できない' do
        @ordershipping.city = nil
        @ordershipping.valid?
        expect(@ordershipping.errors.full_messages).to include("City can't be blank")
      end
      it '配送先の情報として、番地がなければ購入できない' do
        @ordershipping.address = nil
        @ordershipping.valid?
        expect(@ordershipping.errors.full_messages).to include("Address can't be blank")
      end
      it '配送先の情報として、電話番号がなければ購入できない' do
        @ordershipping.phone_number = nil
        @ordershipping.valid?
        expect(@ordershipping.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
      end
      it '電話番号が11桁以上だと購入できないこと' do
        @ordershipping.phone_number = '123456789012'
        @ordershipping.valid?
        expect(@ordershipping.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号にはハイフンがあると購入できないこと' do
        @ordershipping.phone_number = '0120-34-5678'
        @ordershipping.valid?
        expect(@ordershipping.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号に全角数字以外が含まれていると購入できない' do
        @ordershipping.phone_number = '０１２３４５６７８９'
        @ordershipping.valid?
        expect(@ordershipping.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号に数字以外が含まれていると購入できない' do
        @ordershipping.phone_number = 'あ１２３４５６７８９'
        @ordershipping.valid?
        expect(@ordershipping.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @ordershipping.token = nil
        @ordershipping.valid?
        expect(@ordershipping.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと購入できない' do
        @ordershipping.user_id = nil
        @ordershipping.valid?
        expect(@ordershipping.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @ordershipping.item_id = nil
        @ordershipping.valid?
        expect(@ordershipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
