require "application_system_test_case"

class HorizonBankTransactionsTest < ApplicationSystemTestCase
  setup do
    @horizon_bank_transaction = horizon_bank_transactions(:one)
  end

  test "visiting the index" do
    visit horizon_bank_transactions_url
    assert_selector "h1", text: "Horizon bank transactions"
  end

  test "should create horizon bank transaction" do
    visit horizon_bank_transactions_url
    click_on "New horizon bank transaction"

    fill_in "Amount", with: @horizon_bank_transaction.amount
    fill_in "Description", with: @horizon_bank_transaction.description
    fill_in "Transaction key", with: @horizon_bank_transaction.transaction_key
    click_on "Create Horizon bank transaction"

    assert_text "Horizon bank transaction was successfully created"
    click_on "Back"
  end

  test "should update Horizon bank transaction" do
    visit horizon_bank_transaction_url(@horizon_bank_transaction)
    click_on "Edit this horizon bank transaction", match: :first

    fill_in "Amount", with: @horizon_bank_transaction.amount
    fill_in "Description", with: @horizon_bank_transaction.description
    fill_in "Transaction key", with: @horizon_bank_transaction.transaction_key
    click_on "Update Horizon bank transaction"

    assert_text "Horizon bank transaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Horizon bank transaction" do
    visit horizon_bank_transaction_url(@horizon_bank_transaction)
    click_on "Destroy this horizon bank transaction", match: :first

    assert_text "Horizon bank transaction was successfully destroyed"
  end
end
