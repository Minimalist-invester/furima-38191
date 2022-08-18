 FactoryBot.define do
   factory :order_form do
     postcode { '123-1234' }
     prefecure_id { 2 }
     city { '神奈川県' }
     block { '横浜市' }
     building { 'アパート' }
     phone_number { 1234567890 }
     token { Faker::Internet.password(min_length: 20, max_length: 30) }
   end
 end