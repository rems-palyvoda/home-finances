# frozen_string_literal: true

class Transaction < ApplicationRecord
  validates :title, presence: true
  validates :direction, presence: true

  monetize :price_cents

  belongs_to :user

  enum direction: %i[expence income]

  private
end
