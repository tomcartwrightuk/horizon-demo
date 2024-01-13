module MoneyHelper
  def amount_with_sign(amount)
    amount.positive? ? "£#{amount}" : "-£#{-amount}"
  end
end
