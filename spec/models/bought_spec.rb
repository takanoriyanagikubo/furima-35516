require 'rails_helper'

RSpec.describe Bought, type: :model do

     before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @bought = FactoryBot.build(:bought, user_id: user.id, item_id: item.id)
      sleep 1
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
        @bought.area_id= ""
        @bought.valid?
        expect(@bought.errors.full_messages).to include("Area is not a number")
      end

      it '都道府県が1では登録できないこと' do
        @bought.area_id= 1
        @bought.valid?
        expect(@bought.errors.full_messages).to include("Area must be other than 1")
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

      it '電話番号は9桁以内では登録できないこと' do
        @bought.phone_number= "123456789"
        @bought.valid?
        expect(@bought.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号は12桁以上では登録できないこと' do
        @bought.phone_number= "123456789012"
        @bought.valid?
        expect(@bought.errors.full_messages).to include("Phone number is invalid")
      end

      it 'user_idが空では登録できないこと' do
        @bought.user_id= ""
        @bought.valid?
        expect(@bought.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できないこと' do
        @bought.item_id= ""
        @bought.valid?
        expect(@bought.errors.full_messages).to include("Item can't be blank")
      end

      it '電話番号が英数字混合では登録できない。こと' do
        @bought.phone_number= "0901234qwer"
        @bought.valid?
        expect(@bought.errors.full_messages).to include("Phone number is invalid")
      end

      it '市区が空では登録できないこと' do
        @bought.city= ""
        @bought.valid?
        expect(@bought.errors.full_messages).to include("City can't be blank")
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

        it "建物名が空でも登録できる" do
          @bought.building_name= ""
          expect(@bought).to be_valid
        end

      end

    end
end
