FactoryBot.define do
  factory :item do
    product             { 'hoge' }
    product_description { 'こんにちは' }
    price               { 5000 }
    category_id         { 2 }
    condition_id        { 2 }
    bearer_id           { 2 }
    prefecure_id        { 2 }
    ship_date_id        { 2 }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end