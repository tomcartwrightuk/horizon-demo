require "application_system_test_case"

class HorizonCashTransactionsTest < ApplicationSystemTestCase
  setup do
    @horizon_cash_transaction = horizon_cash_transactions(:one)
  end

  test "visiting the index" do
    visit horizon_cash_transactions_url
    assert_selector "h1", text: "Horizon cash transactions"
  end

  test "should create horizon cash transaction" do
    visit horizon_cash_transactions_url
    click_on "New horizon cash transaction"

    fill_in "Amount", with: @horizon_cash_transaction.amount
    fill_in "Description", with: @horizon_cash_transaction.description
    fill_in "Transaction key", with: @horizon_cash_transaction.transaction_key
    click_on "Create Horizon cash transaction"

    assert_text "Horizon cash transaction was successfully created"
    click_on "Back"
  end

  test "should update Horizon cash transaction" do
    visit horizon_cash_transaction_url(@horizon_cash_transaction)
    click_on "Edit this horizon cash transaction", match: :first

    fill_in "Amount", with: @horizon_cash_transaction.amount
    fill_in "Description", with: @horizon_cash_transaction.description
    fill_in "Transaction key", with: @horizon_cash_transaction.transaction_key
    click_on "Update Horizon cash transaction"

    assert_text "Horizon cash transaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Horizon cash transaction" do
    visit horizon_cash_transaction_url(@horizon_cash_transaction)
    click_on "Destroy this horizon cash transaction", match: :first

    assert_text "Horizon cash transaction was successfully destroyed"
  end
end
