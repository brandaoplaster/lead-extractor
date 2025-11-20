FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    product_code { "PROD-#{Faker::Alphanumeric.alphanumeric(number: 6).upcase}" }
    subject { Faker::Lorem.sentence }
  end
end
