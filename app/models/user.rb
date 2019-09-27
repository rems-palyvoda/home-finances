# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :transactions, dependent: :destroy

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
