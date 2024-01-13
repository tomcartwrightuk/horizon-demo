require "application_system_test_case"

class BranchCashTransactionsTest < ApplicationSystemTestCase
  setup do
    @branch_cash_transaction = branch_cash_transactions(:one)
  end

  test "visiting the index" do
    visit branch_cash_transactions_url
    assert_selector "h1", text: "Branch cash transactions"
  end

  test "should create branch cash transaction" do
    visit branch_cash_transactions_url
    click_on "New branch cash transaction"

    fill_in "Amount", with: @branch_cash_transaction.amount
    fill_in "Description", with: @branch_cash_transaction.description
    fill_in "Transaction key", with: @branch_cash_transaction.transaction_key
    click_on "Create Branch cash transaction"

    assert_text "Branch cash transaction was successfully created"
    click_on "Back"
  end

  test "should update Branch cash transaction" do
    visit branch_cash_transaction_url(@branch_cash_transaction)
    click_on "Edit this branch cash transaction", match: :first

    fill_in "Amount", with: @branch_cash_transaction.amount
    fill_in "Description", with: @branch_cash_transaction.description
    fill_in "Transaction key", with: @branch_cash_transaction.transaction_key
    click_on "Update Branch cash transaction"

    assert_text "Branch cash transaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Branch cash transaction" do
    visit branch_cash_transaction_url(@branch_cash_transaction)
    click_on "Destroy this branch cash transaction", match: :first

    assert_text "Branch cash transaction was successfully destroyed"
  end
end
