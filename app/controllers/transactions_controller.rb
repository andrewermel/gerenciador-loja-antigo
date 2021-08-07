class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]

  # GET /transactions or /transactions.json
  def index
    @transactions = filter_transactions
    @total = 0
    @transactions.each do |transaction|
      @total += transaction.quantity * transaction.price_per_unity
    end
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @users = User.all
    @products = Product.all
  end

  # GET /transactions/1/edit
  def edit
    @users = User.all
    @products = Product.all
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    @transaction.price_per_unity *= -1 if buying?

    respond_to do |format|
      if @transaction.save
        update_inventory
        format.html { redirect_to @transaction, notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:quantity, :price_per_unity, :product_id, :user_id)
  end

  def update_inventory
    product = @transaction.product
    quantity_diff = @transaction.quantity
    quantity_diff *= -1 unless buying?
    product.quantity += quantity_diff
    product.save
  end

  def filter_transactions
    return Transaction.where('created_at > ?', params[:since]) if params[:since].present?
    return Transaction.all unless params[:transaction_type].present?
    return Transaction.where('price_per_unity <= 0') if buying?
    Transaction.where('price_per_unity > 0')
  end

  def buying?
    params[:transaction_type] == 'buy'
  end
end
