# frozen_string_literal: true

class Transaction < ApplicationRecord
  validates :name, presence: true
  validates :price_cents, presence: true
  validates :price_currency, presence: true

  monetize :price_cents

  belongs_to :user
end
