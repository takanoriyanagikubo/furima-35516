require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
      @user = FactoryBot.build(:user)
    end

    describe '#create' do
      context '新規登録がうまくいかないとき' do
      it 'nick_nameが空では登録できないこと' do
        @user.nick_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが空では登録できないこと' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'last_name_kanaが空では登録できないこと' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "emailに@がないと登録できない" do
        @user.email = "kkkgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "first_name_kanaは全角（カタカナ）でなければ登録できない" do
          @user.first_name_kana = "かな"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      
        it "last_name_kanaは全角（カタカナ）でなければ登録できない" do
          @user.last_name_kana = "かな"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid")
        end
      
        it "生年月日が空だと登録できない" do
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
    end


    context '新規登録がうまくいくとき' do

      it 'passwordが6文字以上であれば登録できること' do
        @user.password = '1234qw'
        @user.password_confirmation = '1234qw'
        expect(@user).to be_valid
      end

      
      it 'パスワードは、半角英数字混合での入力が必須であれば登録できること' do
        @user.password = '1111qw'
        @user.password_confirmation = '1111qw'
        expect(@user).to be_valid
      end

      it '全ての情報が登録できる' do
        expect(@user).to be_valid
      end


    end
      
  end
end