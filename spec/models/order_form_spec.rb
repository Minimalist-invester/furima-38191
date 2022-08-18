 require 'rails_helper'
 
 RSpec.describe OrderForm, type: :model do
   before do
     user = FactoryBot.create(:user)
     item = FactoryBot.create(:item)
     @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
     sleep 0.1
   end
 
   describe '配送先保存' do
     context '配送先が保存できる場合' do
       it 'すべて正しく入力されている' do
         expect(@order_form).to be_valid
       end
       it '建物名が空でも保存できる' do
         @order_form.building = ''
         expect(@order_form).to be_valid
       end
       it '電話番号が10桁でも保存できる' do
         @order_form.phone_number = '1234567890'
         expect(@order_form).to be_valid
       end
       it '電話番号が11桁でも保存できる' do
         @order_form.phone_number = '12345678901'
         expect(@order_form).to be_valid
       end
     end
 
     context '配送先が保存できない場合' do
       it '郵便番号が空だと保存できない' do
         @order_form.postcode = ''
         @order_form.valid?
         expect(@order_form.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
       end
       it '郵便番号が全角だと保存できない' do
         @order_form.postcode = '１２３ー１２３４'
         @order_form.valid?
         expect(@order_form.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
       end
       it '郵便番号が3桁-4桁の形じゃないと保存できない' do
         @order_form.postcode = '1234-123'
         @order_form.valid?
         expect(@order_form.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
       end
       it '都道府県が1だと保存できない' do
         @order_form.prefecure_id = '1'
         @order_form.valid?
         expect(@order_form.errors.full_messages).to include('Prefecure must be other than 1')
       end
       it '市区町村が空だと保存できない' do
         @order_form.city = ''
         @order_form.valid?
         expect(@order_form.errors.full_messages).to include("City can't be blank")
       end
       it '番地が空だと保存できない' do
         @order_form.block = ''
         @order_form.valid?
         expect(@order_form.errors.full_messages).to include("Block can't be blank")
       end
       it '電話番号が空だと保存できない' do
         @order_form.phone_number = ''
         @order_form.valid?
         @order_form.valid?
         expect(@order_form.errors.full_messages).to include('Phone number is invalid')
       end
       it '電話番号が全角だと保存できない' do
         @order_form.phone_number = '１２３４５６７８９０'
         @order_form.valid?
         @order_form.valid?
         expect(@order_form.errors.full_messages).to include('Phone number is invalid')
       end
       it '電話番号が9文字以下だと保存できない' do
         @order_form.phone_number = '123456789'
         @order_form.valid?
         @order_form.valid?
         expect(@order_form.errors.full_messages).to include('Phone number is invalid')
       end
       it '電話番号が12文字以上だと保存できない' do
         @order_form.phone_number = '123456789012'
         @order_form.valid?
         @order_form.valid?
         expect(@order_form.errors.full_messages).to include('Phone number is invalid')
       end
       it 'user_idが空だと保存できない' do
         @order_form.user_id = nil
         @order_form.valid?
         expect(@order_form.errors.full_messages).to include("User can't be blank")
       end
       it 'item_idが空だと保存できない' do
         @order_form.item_id = nil
         @order_form.valid?
         expect(@order_form.errors.full_messages).to include("Item can't be blank")
       end
       it 'tokenが空では保存できない' do
         @order_form.token = nil
         @order_form.valid?
         expect(@order_form.errors.full_messages).to include("Token can't be blank")
       end
     end
   end
 end