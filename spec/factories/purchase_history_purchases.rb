FactoryBot.define do
  factory :purchase_history_purchase do
    post_code { '123-4567' }
    prefecture_id  { 2 }
    city           { '札幌' }
    address        { '桜町' }
    building       { '桜ハイツ' }
    phone_number   { '1234567890' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
