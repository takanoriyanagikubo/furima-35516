require 'rails_helper'

RSpec.describe Delivery, type: :model do

     before do
       @delivery = FactoryBot.build(:delivery)
     end
  describe '#create' do

    context '商品登録がうまくいかない時' do

      it '郵便番号が空では登録できないこと' do
        @delivery.postal_code= ""
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Buy must exist")
      end

      it '郵便番号にハイフンがないと登録できないこと' do
        @delivery.postal_code= "3500821"
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Buy must exist")
      end

      it '都道府県が空では登録できないこと' do
        @delivery.city= ""
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Buy must exist")
      end

      it '住所が空では登録できないこと' do
        @delivery.address= ""
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Buy must exist")
      end

      it '電話番号が空では登録できないこと' do
        @delivery.phone_number= ""
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Buy must exist")
      end

      it '電話番号は11桁以内のみでした登録できないこと' do
        @delivery.phone_number= "111111111111"
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Buy must exist")
      end

      it '市区が空では登録できないこと' do
        @delivery.area_id= ""
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Buy must exist")
      end

      it "tokenが空では登録できないこと" do
        @delivery.token= ""
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Buy must exist")
      end

    end
  end
end
