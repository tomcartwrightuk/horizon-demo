class HorizonCashTransactionsController < ApplicationController
  before_action :set_horizon_cash_transaction, only: %i[ show edit update destroy ]

  # GET /horizon_cash_transactions or /horizon_cash_transactions.json
  def index
    @horizon_cash_transactions = HorizonCashTransaction.all
    @horizon_bank_transactions = HorizonBankTransaction.all
  end

  # GET /horizon_cash_transactions/1 or /horizon_cash_transactions/1.json
  def show
  end

  # GET /horizon_cash_transactions/new
  def new
    amount = 500
    key = SecureRandom.hex(5)
    if BranchCashTransaction.count == 0
      HorizonCashTransaction.create!(
        amount: -amount,
        description: "Cash supply to Priory Branch",
        transaction_key: key
      )
      BranchCashTransaction.create!(
        amount: amount,
        description: "Cash supply from central office",
        transaction_key: key
      )
    end
    render :new
  end

  # GET /horizon_cash_transactions/1/edit
  def edit
  end

  # POST /horizon_cash_transactions or /horizon_cash_transactions.json
  def create
    @horizon_cash_transaction = HorizonCashTransaction.new(horizon_cash_transaction_params)

    respond_to do |format|
      if @horizon_cash_transaction.save
        format.html { redirect_to horizon_cash_transaction_url(@horizon_cash_transaction), notice: "Horizon cash transaction was successfully created." }
        format.json { render :show, status: :created, location: @horizon_cash_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @horizon_cash_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /horizon_cash_transactions/1 or /horizon_cash_transactions/1.json
  def update
    respond_to do |format|
      if @horizon_cash_transaction.update(horizon_cash_transaction_params)
        format.html { redirect_to horizon_cash_transaction_url(@horizon_cash_transaction), notice: "Horizon cash transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @horizon_cash_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @horizon_cash_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /horizon_cash_transactions/1 or /horizon_cash_transactions/1.json
  def destroy
    @horizon_cash_transaction.destroy!

    respond_to do |format|
      format.html { redirect_to horizon_cash_transactions_url, notice: "Horizon cash transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horizon_cash_transaction
      @horizon_cash_transaction = HorizonCashTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def horizon_cash_transaction_params
      params.require(:horizon_cash_transaction).permit(:description, :amount, :transaction_key)
    end
end
