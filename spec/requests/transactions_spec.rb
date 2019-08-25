# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transactions API', type: :request do
  let(:transactions_count) { 3 }
  let(:user) { create :user }
  let!(:transactions) { create_list :transaction, transactions_count, user: user }

  describe 'GET /transactions' do
    before { get '/transactions' }

    it 'returns trsansactions' do
      expect(json).not_to be_empty
      expect(json.size).to eq(transactions_count)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
