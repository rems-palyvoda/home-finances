# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transactions API', type: :request do
  let(:user) { create :user }
  let!(:transaction) { create :transaction, user: user }
  let(:headers) { valid_headers }

  describe 'GET /transactions' do
    before { get '/transactions', headers: headers }

    it 'returns trsansactions' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /transaction/:id' do
    let(:params) { { transaction: { user_id: user.id } }.to_json }

    before { get "/transactions/#{id}", params: params, headers: headers }

    context 'when transaction present' do
      let(:id) { transaction.id }

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
    before { post '/transactions', params: params, headers: headers }

    context 'when valid params' do
      let(:title) { 'new transaction' }
      let(:params) { { transaction: { user_id: user.id, title: title, direction: 'expence' } }.to_json }

      it 'returns status ok' do
        expect(response).to have_http_status(201)
      end

      it 'returns transaction' do
        expect(json['title']).to eq(title)
      end
    end

    context 'when invalid params' do
      let(:params) { { transaction: { user_id: user.id } }.to_json }

      it 'returns status :unprocessable_entity' do
        expect(response).to have_http_status(422)
      end

      it 'returns error message' do
        expect(json.keys).to include('validation_errors')
      end
    end
  end

  describe 'PUT /transactions/:id' do
    let(:title) { 'updated_title' }
    let(:id) { transaction.id }
    let(:params) { { transaction: { title: title } }.to_json }

    before { put "/transactions/#{id}", params: params, headers: headers }

    it 'returns status updated' do
      expect(response).to have_http_status(200)
    end

    it 'returns updated transaction' do
      expect(json['title']).to eq(title)
    end
  end

  describe 'DELETE /transactions/:id' do
    let(:id) { transaction.id }

    before { delete "/transactions/#{id}", headers: headers }

    it 'returns status no content' do
      expect(response).to have_http_status(204)
    end
  end
end
