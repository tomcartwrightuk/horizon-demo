class HorizonBankTransactionsController < ApplicationController
  before_action :set_horizon_bank_transaction, only: %i[ show edit update destroy ]

  # GET /horizon_bank_transactions or /horizon_bank_transactions.json
  def index
    @horizon_bank_transactions = HorizonBankTransaction.all
    @total = @horizon_bank_transactions.sum(&:amount)
  end

  # GET /horizon_bank_transactions/1 or /horizon_bank_transactions/1.json
  def show
  end

  # GET /horizon_bank_transactions/new
  def new
    @horizon_bank_transaction = HorizonBankTransaction.new
  end

  # GET /horizon_bank_transactions/1/edit
  def edit
  end

  # POST /horizon_bank_transactions or /horizon_bank_transactions.json
  def create
    @horizon_bank_transaction = HorizonBankTransaction.new(horizon_bank_transaction_params)

    respond_to do |format|
      if @horizon_bank_transaction.save
        format.html { redirect_to horizon_bank_transaction_url(@horizon_bank_transaction), notice: "Horizon bank transaction was successfully created." }
        format.json { render :show, status: :created, location: @horizon_bank_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @horizon_bank_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /horizon_bank_transactions/1 or /horizon_bank_transactions/1.json
  def update
    respond_to do |format|
      if @horizon_bank_transaction.update(horizon_bank_transaction_params)
        format.html { redirect_to horizon_bank_transaction_url(@horizon_bank_transaction), notice: "Horizon bank transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @horizon_bank_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @horizon_bank_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /horizon_bank_transactions/1 or /horizon_bank_transactions/1.json
  def destroy
    @horizon_bank_transaction.destroy!

    respond_to do |format|
      format.html { redirect_to horizon_bank_transactions_url, notice: "Horizon bank transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horizon_bank_transaction
      @horizon_bank_transaction = HorizonBankTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def horizon_bank_transaction_params
      params.require(:horizon_bank_transaction).permit(:description, :amount, :transaction_key)
    end
end
