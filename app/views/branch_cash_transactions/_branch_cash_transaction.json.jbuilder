json.extract! branch_cash_transaction, :id, :description, :amount, :transaction_key, :created_at, :updated_at
json.url branch_cash_transaction_url(branch_cash_transaction, format: :json)
