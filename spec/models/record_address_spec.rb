require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @record_address = FactoryBot.build(:record_address,user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@record_address).to be_valid
      end
      it '郵便番号が「3桁ハイフン4桁」の組み合わせであれば保存できる' do
        @record_address.post_code = '123-4567'
        expect(@record_address).to be_valid
      end
      it '都道府県が「---」以外であれば保存できる' do
        @record_address.state_id = 1
        expect(@record_address).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @record_address.city = '東京都'
        expect(@record_address).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @record_address.address = '1-1'
        expect(@record_address).to be_valid
      end
      it '建物名が空でも保存できる' do
        @record_address.building_name = nil
        expect(@record_address).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなし且つ半角文字であれば保存できる' do
        @record_address.tel = '12345678910'
        expect(@record_address).to be_valid
      end
      it 'tokenがあれば保存できる' do
        @record_address.token = '"tok_abcdefghijk00000000000000000"'
        expect(@record_address).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it '郵便番号が空だと保存できない' do
        @record_address.post_code = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end
      it '郵便番号が「3桁ハイフン4桁」の組み合わせでなければ保存できない' do
        @record_address.post_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県が「---」だと保存できない' do
        @record_address.state_id = 0
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("State must be other than 0")
      end
      it '市区町村が空だと保存できないこと' do
        @record_address.city = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @record_address.address = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @record_address.tel = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号が半角数値でなければ保存できない' do
        @record_address.tel = '４５６'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Tel is invalid", "Tel is not a number")
      end
      it '電話番号にハイフンがあると保存できない' do
        @record_address.tel = '123 - 1234 - 1234'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Tel is invalid')
      end
      it '電話番号が12桁以上あると保存できない' do
        @record_address.tel = '12345678910123111'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end