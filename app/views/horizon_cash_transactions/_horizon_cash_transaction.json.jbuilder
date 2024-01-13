json.extract! horizon_cash_transaction, :id, :description, :amount, :transaction_key, :created_at, :updated_at
json.url horizon_cash_transaction_url(horizon_cash_transaction, format: :json)
