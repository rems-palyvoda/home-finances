# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :set_user
  before_action :set_transaction, only: %i[show update destroy]

  def index
    @transactions = @current_user.transactions
    json_response @transactions
  end

  def show
    json_response @transaction
  end

  def create
    @transaction = @current_user.transactions.build(transaction_params)
    if @transaction.save
      json_response @transaction, status: :created
    else
      message = { validation_errors: @transaction.errors }
      json_response message, status: :unprocessable_entity
    end
  end

  def update
    if @transaction.update transaction_params
      json_response @transaction, status: :ok
    else
      message = { validation_errors: @transaction.errors }
      json_response message, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.destroy
    head :no_content
  end

  private

  def set_user
    @current_user = User
                    .includes(:transactions)
                    .find(transaction_params[:user_id])
  end

  def set_transaction
    @transaction = @current_user.transactions.find(params[:id])
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
