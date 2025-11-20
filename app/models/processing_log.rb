# frozen_string_literal: true

class ProcessingLog < ApplicationRecord
  has_one_attached :email_file
  belongs_to :customer, optional: true

  enum status: {
    pending: 0,
    success: 1,
    failed: 2
  }

  validates :filename, presence: true
  validates :status, presence: true
end
