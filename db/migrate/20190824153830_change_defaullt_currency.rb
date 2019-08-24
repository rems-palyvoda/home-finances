class ChangeDefaulltCurrency < ActiveRecord::Migration[6.0]
  def change
    change_column :transactions,
                  :price_currency,
                  :string,
                  default: 'UAH',
                  null: false
  end
end
