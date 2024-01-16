class CreateHorizonRecordJob < ApplicationJob
  queue_as :default
  BACKOFF_TIMINGS = [1, 2, 4].freeze

  def perform(data)
    begin
      HTTParty.post("http://horizon:3011/horizon_cash_transactions", body: {
        horizon_cash_transaction: data
      })
    rescue SocketError
      BACKOFF_TIMINGS.each do |i|
        CreateHorizonRecordJob.set(wait: i.seconds).perform_later(data)
      end
    end
  end
end
