class IventoryProductsController < ApplicationController
  before_action :set_iventory_product, only: %i[ show edit update destroy ]

  # GET /iventory_products or /iventory_products.json
  def index
    @iventory_products = IventoryProduct.all
  end

  # GET /iventory_products/1 or /iventory_products/1.json
  def show
  end

  # GET /iventory_products/new
  def new
    @iventory_product = IventoryProduct.new
  end

  # GET /iventory_products/1/edit
  def edit
  end

  # POST /iventory_products or /iventory_products.json
  def create
    @iventory_product = IventoryProduct.new(iventory_product_params)

    respond_to do |format|
      if @iventory_product.save
        format.html { redirect_to @iventory_product, notice: "Iventory product was successfully created." }
        format.json { render :show, status: :created, location: @iventory_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @iventory_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iventory_products/1 or /iventory_products/1.json
  def update
    respond_to do |format|
      if @iventory_product.update(iventory_product_params)
        format.html { redirect_to @iventory_product, notice: "Iventory product was successfully updated." }
        format.json { render :show, status: :ok, location: @iventory_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @iventory_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iventory_products/1 or /iventory_products/1.json
  def destroy
    @iventory_product.destroy
    respond_to do |format|
      format.html { redirect_to iventory_products_url, notice: "Iventory product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iventory_product
      @iventory_product = IventoryProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def iventory_product_params
      params.require(:iventory_product).permit(:quantity, :product_id)
    end
end
