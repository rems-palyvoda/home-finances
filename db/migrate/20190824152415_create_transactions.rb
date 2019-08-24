class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string      :title
      t.monetize    :price
      t.string      :category
      t.string      :description
      t.string      :photo
      t.integer     :direction
      t.references  :user

      t.timestamps
    end
  end
end
