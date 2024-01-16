class CreateHorizonRecordJob < ApplicationJob
  queue_as :default

  def perform(data)
    HTTParty.post("http://horizon:3011/horizon_cash_transactions", body: {
      horizon_cash_transaction: data
    })
  end
end
