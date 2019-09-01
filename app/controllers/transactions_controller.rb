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

  def create
    @transaction = Transaction.new transaction_params
    if @transaction.save
      json_response @transaction, status: :created
    else
      message = {validation_errors: @transaction.errors}
      json_response message, status: :unprocessable_entity
    end
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
