class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.string :comment

      t.timestamps null: false
    end
  end
end
