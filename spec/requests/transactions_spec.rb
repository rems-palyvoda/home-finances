# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transactions API', type: :request do
  let(:transactions_count) { 3 }
  let(:user) { create :user }
  let!(:transactions) { create_list :transaction, transactions_count, user: user }

  describe 'GET /transactions' do
    before { get '/transactions', params: { transaction: {user_id: user.id}} }

    it 'returns trsansactions' do
      expect(json).not_to be_empty
      expect(json.size).to eq(transactions_count)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /transaction/:id' do
    before { get "/transactions/#{id}", params: { transaction: {user_id: user.id}} }

    context 'when transaction present' do
      let(:id) { transactions.last.id }

      it 'returns status ok' do
        expect(response).to have_http_status(200)
      end

      it 'returns transaction' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when transaction absent' do
      let(:id) { 999 }

      it 'returns status not found' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /transactions' do
    before { post '/transactions', params: params }

    context 'when valid params' do
      let(:params) { {transaction: {user_id: user.id, title: 'new transaction', direction: 'expence'}} }

      it 'returns status ok' do
        expect(response).to have_http_status(201)
      end

      it 'returns transaction' do
        expect(json.keys).to eq %w[id title price_cents price_currency category description photo direction user_id created_at updated_at]
      end
    end

    context 'when invalid params' do
      let(:params) { { transaction: { user_id: user.id } } }

      it 'returns status :unprocessable_entity' do
        expect(response).to have_http_status(422)
      end

      it 'returns error message' do
        expect(json.keys).to include('validation_errors')
      end
    end
  end
end
