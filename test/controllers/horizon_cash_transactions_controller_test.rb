require "test_helper"

class HorizonCashTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @horizon_cash_transaction = horizon_cash_transactions(:one)
  end

  test "should get index" do
    get horizon_cash_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_horizon_cash_transaction_url
    assert_response :success
  end

  test "should create horizon_cash_transaction" do
    assert_difference("HorizonCashTransaction.count") do
      post horizon_cash_transactions_url, params: { horizon_cash_transaction: { amount: @horizon_cash_transaction.amount, description: @horizon_cash_transaction.description, transaction_key: @horizon_cash_transaction.transaction_key } }
    end

    assert_redirected_to horizon_cash_transaction_url(HorizonCashTransaction.last)
  end

  test "should show horizon_cash_transaction" do
    get horizon_cash_transaction_url(@horizon_cash_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_horizon_cash_transaction_url(@horizon_cash_transaction)
    assert_response :success
  end

  test "should update horizon_cash_transaction" do
    patch horizon_cash_transaction_url(@horizon_cash_transaction), params: { horizon_cash_transaction: { amount: @horizon_cash_transaction.amount, description: @horizon_cash_transaction.description, transaction_key: @horizon_cash_transaction.transaction_key } }
    assert_redirected_to horizon_cash_transaction_url(@horizon_cash_transaction)
  end

  test "should destroy horizon_cash_transaction" do
    assert_difference("HorizonCashTransaction.count", -1) do
      delete horizon_cash_transaction_url(@horizon_cash_transaction)
    end

    assert_redirected_to horizon_cash_transactions_url
  end
end
