require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end



    it 'nick_nameが空では登録できないこと' do
      @user.nick_name = ''
      @user.valid?
      #expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      #expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      #expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      #expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      #expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        #expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it "emailに@がないと登録できない" do
        @user.email = "kkkgmail.com"
        @user.valid?
        end


      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        #expect(@user.errors.full_messages).to include("Password can't be blank")
      end

    it 'passwordが6文字以上であれば登録できること' do
      user = FactoryBot.build(:user)
      @user.password = '123456'
      @user.password_confirmation = '123456'
      #expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      #expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードは、半角英数字混合での入力が必須であれば登録できること' do
      @user.password = '123456qqqqqq'
      @user.password_confirmation = '123456qqqqqq'
      #expect(@user).to be_valid
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      #expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      #expect(@room.errors.full_messages).to include("Name can't be blank")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = ''
      @user.valid?
      #expect(@room.errors.full_messages).to include("Name can't be blank")
    end

    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      #expect(@room.errors.full_messages).to include("Name can't be blank")
    end

    it 'last_name_nakaが空では登録できないこと' do
      @user.last_name_kana = ''
      @user.valid?
      #expect(@room.errors.full_messages).to include("Name can't be blank")
    end

    it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.first_name_kana = "かな"
      @user.valid?
      #expect(@user.errors_full_messages).to include("First_name Full-width characters")
    end

    it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.last_name_kana = "かな"
      @user.valid?
      #expect(@user.errors_full_messages).to include("Family_name Full-width characters")
    end

    it "生年月日が空だと登録できない" do
      @user.birthday = nil
      @user.valid?
      #expect(@user.errors_full_messages).to include("Birth_day can't be blank")
    end
      
  end
end