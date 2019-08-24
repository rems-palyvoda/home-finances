# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    user
    name { 'Transaction' }
    direction { Transaction.directions.keys.sample }
  end
end
