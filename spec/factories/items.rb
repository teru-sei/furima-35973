FactoryBot.define do
  factory :item do
    item_name { Faker::Name.initials(number: 2) }
    item_description { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    delivery_price_id { 2 }
    delivery_day_id { 2 }
    prefecture_id { 2 }
    item_price { 500 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/VV39-20108081_5.jpeg'), filename: 'VV39-20108081_5.jpeg')
    end
  end
end
