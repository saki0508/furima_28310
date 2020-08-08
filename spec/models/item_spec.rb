require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'ユーザー情報の保存' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/cns0011-039.jpg')
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end

    it '商品名が空だと保存されないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が空だと保存されないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリー情報が選択されていないと保存されないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")

    end
    it '商品の状態についての情報が選択されていないと保存されないこと' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("State must be other than 1")
    end
    
    it '配送料の負担についての情報が選択されていないと保存されないこと' do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage must be other than 1")
    end
    it '発送元の地域についての情報が選択されていないと保存されないこと' do
      @item.region_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Region must be other than 1")
    end
    it '発送までの日数についての情報が選択されていないと保存されないこと' do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
    end
    it '価格が空だと保存されないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '¥300より安いと保存さてないこと' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it '¥9,999,999より高いと保存できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
  end
end
