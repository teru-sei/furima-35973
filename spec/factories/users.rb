FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    last_name             { '井上' }
    first_name            { '太郎' }
    last_name_ka          { 'イノウエ' }
    first_name_ka         { 'タロウ' }
    birthday              { '1930-1-29' }
  end
end
