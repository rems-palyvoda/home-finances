class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string      :name
      t.monetize    :price
      t.string      :category
      t.string      :description
      t.string      :photo
      t.integer     :type
      t.references  :user

      t.timestamps
    end
  end
end
