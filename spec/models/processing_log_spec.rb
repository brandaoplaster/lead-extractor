require 'rails_helper'

RSpec.describe ProcessingLog, type: :model do
  describe 'validations' do
      it { should validate_presence_of(:filename) }
      it { should validate_presence_of(:status) }
    end

  describe 'associations' do
    it { should belong_to(:customer).optional }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(pending: 0, success: 1, failed: 2) }
  end

  describe 'ActiveStorage' do
    it 'has one attached email_file' do
      expect(ProcessingLog.new.email_file).to be_an_instance_of(ActiveStorage::Attached::One)
    end
  end
end
