require 'rails_helper'

RSpec.describe Item, type: :model do

     before do
       @item = FactoryBot.build(:item)
     end


    describe '#create' do
      context '商品登録がうまくいかない時' do
      it '商品画像が空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できないこと' do
        @item.item_name  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品の説明が空では登録できないこと' do
        @item.description  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーの情報が空では登録できないこと' do
        @item.category_id    = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態についての情報が空では登録できないこと' do
        @item.category_id    = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '配送料の負担についての情報が空では登録できないこと' do
        @item.category_id    = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '発送元の地域についての情報が空では登録できないこと' do
        @item.category_id    = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '発送元の地域についての情報が空では登録できないこと' do
        @item.category_id    = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '発送までの日数についての情報が空では登録できないこと' do
        @item.category_id    = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end



      it 'カテゴリーの情報が1では登録できないこと' do
        @item.category_id    = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態についての情報が1では登録できないこと' do
        @item.category_id    = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '配送料の負担についての情報が1では登録できないこと' do
        @item.category_id    = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '発送元の地域についての情報が1では登録できないこと' do
        @item.category_id    = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '発送元の地域についての情報が1では登録できないこと' do
        @item.category_id    = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '発送までの日数についての情報が1では登録できないこと' do
        @item.category_id    = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end



      it '販売価格についての情報が空では登録できないこと' do
        @item.price   = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が299以下では登録できないこと' do
        @item.price    = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '販売価格が10000000以上では郎録できないこと' do
        @item.price    = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '販売価格が半角数字のみ保存可能であること' do
        @item.price    = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
    context '商品登録がうまく時' do
      it '全ての情報が登録できる' do
      expect(@item).to be_valid
      end
    end

    end
  end
