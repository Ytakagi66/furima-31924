require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    context '商品出品できる時' do
      it '正常に出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない時' do
      it '商品画像が必ず1枚なければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がなければ出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がなければ出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリー情報がなければ出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it 'カテゴリー情報が---だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it '商品状態の情報がなければ出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Status is not a number')
      end
      it '商品状態の情報が---だと出品できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 0')
      end
      it '配送料の負担についての情報がなければ出品できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee is not a number')
      end
      it '配送料の負担についての情報が---だと出品できない' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee must be other than 0')
      end
      it '発送元の地域についての情報がなければ出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it '発送元の地域についての情報が---だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '発送までの日数についての情報がなければ出品できない' do
        @item.scheduled_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled is not a number')
      end
      it '発送までの日数についての情報が---だと出品できない' do
        @item.scheduled_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled must be other than 0')
      end
      it '価格情報がなければ出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is invalid', 'Price is not a number')
      end
      it '価格の範囲が、¥300~¥9,999,999の間でなければ出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it '販売価格は半角数字以外だと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
