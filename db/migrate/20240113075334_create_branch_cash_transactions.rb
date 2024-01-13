class CreateBranchCashTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :branch_cash_transactions do |t|
      t.string :description
      t.integer :amount
      t.string :transaction_key

      t.timestamps
    end
  end
end
