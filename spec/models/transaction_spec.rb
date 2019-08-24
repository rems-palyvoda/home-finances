# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :price_cents }
  it { is_expected.to validate_presence_of :price_currency }
  it { is_expected.to validate_presence_of :direction }

  it { is_expected.to belong_to :user }

  it { should define_enum_for(:direction).with_values(%i[expence income]) }
end
