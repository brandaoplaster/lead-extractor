require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
     subject { build(:customer) }

     it { should validate_presence_of(:name) }
     it { should validate_presence_of(:email) }
     it { should validate_presence_of(:phone) }

     it { should allow_value('test@example.com').for(:email) }
     it { should_not allow_value('invalid_email').for(:email) }
     it { should_not allow_value('').for(:email) }
   end

  describe 'associations' do
    it { should have_many(:processing_logs) }
  end

  describe 'creation' do
    it 'creates a valid customer' do
      customer = build(:customer)
      expect(customer).to be_valid
    end

    it 'fails without name' do
      customer = build(:customer, name: nil)
      expect(customer).not_to be_valid
    end

    it 'fails without email' do
      customer = build(:customer, email: nil)
      expect(customer).not_to be_valid
    end

    it 'fails without phone' do
      customer = build(:customer, phone: nil)
      expect(customer).not_to be_valid
    end
  end
end
