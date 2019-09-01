# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :direction }

  it { is_expected.to belong_to :user }

  it { should define_enum_for(:direction).with_values(%i[expence income]) }

  describe 'default factory' do
    let(:transaction) { build :transaction }

    subject { transaction.valid? }

    it { should be_truthy }
  end
end
