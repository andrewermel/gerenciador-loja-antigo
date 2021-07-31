class BalancesController < ApplicationController
  before_action :set_balance, only: %i[ show edit update destroy ]

  # GET /balances or /balances.json
  def index
    @balances = balances
    @total = 0
    @balances.each do |balance|
      @total += balance.price_per_unity * balance.quantity
    end
  end

  # GET /balances/1 or /balances/1.json
  def show
  end

  # GET /balances/new
  def new
    @balance = Balance.new
  end

  # GET /balances/1/edit
  def edit
  end

  # POST /balances or /balances.json
  def create
    @balance = Balance.new(balance_params)

    respond_to do |format|
      if @balance.save
        format.html { redirect_to @balance, notice: "Balance was successfully created." }
        format.json { render :show, status: :created, location: @balance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /balances/1 or /balances/1.json
  def update
    respond_to do |format|
      if @balance.update(balance_params)
        format.html { redirect_to @balance, notice: "Balance was successfully updated." }
        format.json { render :show, status: :ok, location: @balance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /balances/1 or /balances/1.json
  def destroy
    @balance.destroy
    respond_to do |format|
      format.html { redirect_to balances_url, notice: "Balance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_balance
      @balance = Balance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def balance_params
      params.require(:balance).permit(:quantity, :product_id, :user_id, :price_per_unity)
    end

    def balances
      return Balance.all unless params[:only]

      if params[:only] == 'vendas'
        return Balance.where('price_per_unity >= 0')
      end
      Balance.where('price_per_unity < 0')
    end
end
