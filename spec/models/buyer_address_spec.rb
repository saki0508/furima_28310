require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '配送先住所の保存' do
    before do
      @address = FactoryBot.build(:buyer_address)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@address).to be_valid
    end

    it '郵便番号が空だと保存できないこと' do
      @address.postal_code = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号にハイフンがないと保存できないこと' do
      @address.postal_code = "1234567"
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code Input correctly")
    end

    it '都道府県が選択されていないと保存できないこと' do
      @address.prefecture_id = 1
      @address.valid?
      expect(@address.errors.full_messages).to include("Prefecture Select")
    end

    it '市町村が空だと保存できないこと' do
      @address.city = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空だと保存できないこと' do
      @address.block = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Block can't be blank")
    end

    it '電話番号が空では保存できないこと' do
      @address.phone_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号にハイフンがあると保存できないこと' do
      @address.phone_number = "090-1234-5678"
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number is invalid")
    end

    it '電話番号が11桁以上だと保存できないこと' do
      @address.phone_number = "090123456789"
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
