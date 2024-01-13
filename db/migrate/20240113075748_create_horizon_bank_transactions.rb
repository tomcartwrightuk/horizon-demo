class CreateHorizonBankTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :horizon_bank_transactions do |t|
      t.string :description
      t.integer :amount
      t.string :transaction_key

      t.timestamps
    end
  end
end
