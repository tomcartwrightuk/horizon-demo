json.extract! horizon_bank_transaction, :id, :description, :amount, :transaction_key, :created_at, :updated_at
json.url horizon_bank_transaction_url(horizon_bank_transaction, format: :json)
