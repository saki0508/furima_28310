require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー情報の保存' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end
    it 'ニックネームが空だと保存できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが空だと保存できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '使用済みのメールアドレスだと保存できないこと' do
      @user2 = FactoryBot.create(:user)
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")

    end
    it 'メールアドレスは＠を含む文字列で無いと保存されないこと' do
      @user.email = "sample"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'パスワードが空だと保存できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      
    end
    it 'パスワードが６文字以下では保存できないこと' do
      @user.password = "test1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'パスワードは全角だと保存できないこと' do
      @user.password = "ｔｅｓｔ１２３４"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      
    end
    it 'パスワードは半角数字だけでは保存できないこと' do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it 'パスワードは半角英字だけでは保存できないこと' do
      @user.password = "testtest"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it 'password_confirmationがパスワードと一致しないと保存できないこと' do
      @user.password_confirmation = "test1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'ユーザー本名が全角(漢字･ひらがな･カタカナ)でないと保存できないこと' do
      @user.last_name = 'yamada'
      @user.first_name = 'hanako'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Last name Full-width characters", "First name Full-width characters")
    end
    it 'ユーザー本名の名字が空だと保存できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'ユーザー本名の名前が空だと保存できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")

    end
      
    it 'ユーザー本名のフリガナは全角でないと保存できないこと' do
      @user.last_name_kana = "山田"
      @user.first_name_kana = "花子"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width characters", "First name kana Full-width characters")
    end

    it 'ユーザー本名のフリガナの名字が空だと保存できないこと' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      
    end
    it 'ユーザー本名のフリガナの名前が空だと保存できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it '生年月日が空だと保存できないこと' do
      @user.birth_day = "----------"
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
      
    end
  end
end
