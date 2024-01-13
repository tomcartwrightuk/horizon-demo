require "test_helper"

class BranchCashTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @branch_cash_transaction = branch_cash_transactions(:one)
  end

  test "should get index" do
    get branch_cash_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_branch_cash_transaction_url
    assert_response :success
  end

  test "should create branch_cash_transaction" do
    assert_difference("BranchCashTransaction.count") do
      post branch_cash_transactions_url, params: { branch_cash_transaction: { amount: @branch_cash_transaction.amount, description: @branch_cash_transaction.description, transaction_key: @branch_cash_transaction.transaction_key } }
    end

    assert_redirected_to branch_cash_transaction_url(BranchCashTransaction.last)
  end

  test "should show branch_cash_transaction" do
    get branch_cash_transaction_url(@branch_cash_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_branch_cash_transaction_url(@branch_cash_transaction)
    assert_response :success
  end

  test "should update branch_cash_transaction" do
    patch branch_cash_transaction_url(@branch_cash_transaction), params: { branch_cash_transaction: { amount: @branch_cash_transaction.amount, description: @branch_cash_transaction.description, transaction_key: @branch_cash_transaction.transaction_key } }
    assert_redirected_to branch_cash_transaction_url(@branch_cash_transaction)
  end

  test "should destroy branch_cash_transaction" do
    assert_difference("BranchCashTransaction.count", -1) do
      delete branch_cash_transaction_url(@branch_cash_transaction)
    end

    assert_redirected_to branch_cash_transactions_url
  end
end
