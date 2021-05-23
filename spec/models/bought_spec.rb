require 'rails_helper'

RSpec.describe Bought, type: :model do

     before do
       @bought = FactoryBot.build(:bought)
     end
  describe '#create' do

    context '商品登録がうまくいかない時' do

      it '郵便番号が空では登録できないこと' do
        @bought.postal_code= ""
        @bought.valid?
        expect(@bought.errors.full_messages).to include("Postal code is invalid")
      end

      it '郵便番号にハイフンがないと登録できないこと' do
        @bought.postal_code= "3500821"
        @bought.valid?
        expect(@bought.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が空では登録できないこと' do
        @bought.city= ""
        @bought.valid?
        expect(@bought.errors.full_messages).to include("City can't be blank")
      end

      it '住所が空では登録できないこと' do
        @bought.address= ""
        @bought.valid?
        expect(@bought.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では登録できないこと' do
        @bought.phone_number= ""
        @bought.valid?
        expect(@bought.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は11桁以内のみでした登録できないこと' do
        @bought.phone_number= "111111111111"
        @bought.valid?
        expect(@bought.errors.full_messages).to include("Phone number is invalid")
      end

      it '市区が空では登録できないこと' do
        @bought.area_id= ""
        @bought.valid?
        expect(@bought.errors.full_messages).to include("Area is not a number")
      end

      it "tokenが空では登録できないこと" do
        @bought.token= ""
        @bought.valid?
        expect(@bought.errors.full_messages).to include("Token can't be blank")
      end

    end


      context '新規登録がうまくいくとき' do
  
        it '全ての情報が登録できる' do
          expect(@bought).to be_valid
        end

      end

    end
end
