require "test_helper"

class HorizonBankTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @horizon_bank_transaction = horizon_bank_transactions(:one)
  end

  test "should get index" do
    get horizon_bank_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_horizon_bank_transaction_url
    assert_response :success
  end

  test "should create horizon_bank_transaction" do
    assert_difference("HorizonBankTransaction.count") do
      post horizon_bank_transactions_url, params: { horizon_bank_transaction: { amount: @horizon_bank_transaction.amount, description: @horizon_bank_transaction.description, transaction_key: @horizon_bank_transaction.transaction_key } }
    end

    assert_redirected_to horizon_bank_transaction_url(HorizonBankTransaction.last)
  end

  test "should show horizon_bank_transaction" do
    get horizon_bank_transaction_url(@horizon_bank_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_horizon_bank_transaction_url(@horizon_bank_transaction)
    assert_response :success
  end

  test "should update horizon_bank_transaction" do
    patch horizon_bank_transaction_url(@horizon_bank_transaction), params: { horizon_bank_transaction: { amount: @horizon_bank_transaction.amount, description: @horizon_bank_transaction.description, transaction_key: @horizon_bank_transaction.transaction_key } }
    assert_redirected_to horizon_bank_transaction_url(@horizon_bank_transaction)
  end

  test "should destroy horizon_bank_transaction" do
    assert_difference("HorizonBankTransaction.count", -1) do
      delete horizon_bank_transaction_url(@horizon_bank_transaction)
    end

    assert_redirected_to horizon_bank_transactions_url
  end
end
