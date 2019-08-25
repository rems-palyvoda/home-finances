# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show update destroy]

  def index
    @transactions = Transaction.all
    json_response @transactions
  end

  def show
    json_response @transaction
  end

  private

  def set_transaction
    @transaction = Transaction.find params[:id]
  end

  def transaction_params
    params.require(:transaction).permit(
      :user_id,
      :title,
      :price_cents,
      :price_currency,
      :category,
      :description,
      :photo,
      :direction
    )
  end
end
