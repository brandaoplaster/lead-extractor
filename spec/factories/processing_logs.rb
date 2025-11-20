FactoryBot.define do
  factory :processing_log do
    filename { "email_#{Faker::Alphanumeric.alphanumeric(number: 8)}.eml" }
    status { :pending }
    parser_type { nil }
    extracted_data { {} }
    errors_data { {} }
    error_message { nil }
    customer { nil }

    trait :success do
      status { :success }
      parser_type { "Parsers::FornecedorAParser" }
      extracted_data do
        {
          name: Faker::Name.name,
          email: Faker::Internet.email,
          phone: Faker::PhoneNumber.cell_phone,
          product_code: "PROD-#{Faker::Alphanumeric.alphanumeric(number: 6).upcase}",
          subject: Faker::Lorem.sentence
        }
      end
      association :customer
    end

    trait :failed do
      status { :failed }
      error_message { "No contact information found in email" }
      errors_data do
        {
          message: "No contact information found in email",
          timestamp: Time.current
        }
      end
    end
  end
end
