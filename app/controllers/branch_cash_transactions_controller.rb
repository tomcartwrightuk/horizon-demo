class BranchCashTransactionsController < ApplicationController
  include MoneyHelper
  before_action :set_branch_cash_transaction, only: %i[ show edit update destroy ]

  # GET /branch_cash_transactions or /branch_cash_transactions.json
  def index
    @branch_cash_transactions = BranchCashTransaction.all
    @total = BranchCashTransaction.pluck(:amount)&.reduce(:+) || 0
  end

  # GET /branch_cash_transactions/1 or /branch_cash_transactions/1.json
  def show
  end

  # GET /branch_cash_transactions/new
  def new
    @branch_cash_transaction = BranchCashTransaction.new
  end

  # GET /branch_cash_transactions/1/edit
  def edit
  end

  # POST /branch_cash_transactions or /branch_cash_transactions.json
  def create
    ActiveRecord::Base.transaction do
      key = SecureRandom.hex(5)
      @branch_cash_transaction = BranchCashTransaction.new(
        amount: -branch_cash_transaction_params[:amount].to_i,
        description: branch_cash_transaction_params[:description],
        transaction_key: key
      )
      # raise "Invalid transaction key" if BranchCashTransaction.count > 2
      HorizonBankTransaction.create!(
        amount: branch_cash_transaction_params[:amount].to_i,
        description: branch_cash_transaction_params[:description],
        transaction_key: key
      )
      HorizonCashTransaction.create!(
        amount: -branch_cash_transaction_params[:amount].to_i,
        description: branch_cash_transaction_params[:description],
        transaction_key: key
      )
    end


    respond_to do |format|
      if @branch_cash_transaction.save
        format.html { redirect_to branch_cash_transactions_url }
        format.json { render :show, status: :created, location: @branch_cash_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @branch_cash_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branch_cash_transactions/1 or /branch_cash_transactions/1.json
  def update
    respond_to do |format|
      if @branch_cash_transaction.update(branch_cash_transaction_params)
        format.html { redirect_to branch_cash_transaction_url(@branch_cash_transaction), notice: "Branch cash transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @branch_cash_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @branch_cash_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def reset_demo
    BranchCashTransaction.destroy_all
    HorizonBankTransaction.destroy_all
    HorizonCashTransaction.destroy_all
    HorizonCashTransaction.create(description: "Opening balance", amount: 1000, transaction_key: SecureRandom.hex(5))
    redirect_to branch_cash_transactions_url, notice: "Demo reset"
  end

  # DELETE /branch_cash_transactions/1 or /branch_cash_transactions/1.json
  def destroy
    @branch_cash_transaction.destroy!

    respond_to do |format|
      format.html { redirect_to branch_cash_transactions_url, notice: "Branch cash transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch_cash_transaction
      @branch_cash_transaction = BranchCashTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def branch_cash_transaction_params
      params.require(:branch_cash_transaction).permit(:description, :amount, :transaction_key)
    end
end
