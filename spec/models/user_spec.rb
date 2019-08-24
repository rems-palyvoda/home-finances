# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :email }

  it { is_expected.to have_many(:transactions).dependent(:destroy) }

  describe 'default factory' do
    let(:user) { create :user }

    subject { user.valid? }

    it { should be_truthy }
  end
end
