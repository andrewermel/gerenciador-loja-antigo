class ComprasController < ApplicationController
  def index
  end

  def create
    inventory = Inventory.find_by_product_id(params[:product_id])
    inventory.quantity += quantity_value

    balance = Balance.new(
      quantity: quantity_value,
      product_id: params[:product_id],
      user_id: params[:user_id],
      price_per_unity: - params[:price_per_unity].to_f
    )
    if balance.save
      inventory.save
      return render json: { ok: true }
    end

    render json: { ok: false }
  end

  private

  def quantity_value
    params[:quantity].to_i
  end
end
