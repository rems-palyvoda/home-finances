# frozen_string_literal: true

class Transaction < ApplicationRecord
  after_initialize :default_values

  validates :name, presence: true
  validates :price_cents, presence: true
  validates :price_currency, presence: true
  validates :direction, presence: true

  monetize :price_cents

  belongs_to :user

  enum direction: %i[expence income]

  private

  def default_values
    self.direction ||= 'expence'
  end
end
