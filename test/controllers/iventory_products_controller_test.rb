require "test_helper"

class IventoryProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @iventory_product = iventory_products(:one)
  end

  test "should get index" do
    get iventory_products_url
    assert_response :success
  end

  test "should get new" do
    get new_iventory_product_url
    assert_response :success
  end

  test "should create iventory_product" do
    assert_difference('IventoryProduct.count') do
      post iventory_products_url, params: { iventory_product: { product_id: @iventory_product.product_id, quantity: @iventory_product.quantity } }
    end

    assert_redirected_to iventory_product_url(IventoryProduct.last)
  end

  test "should show iventory_product" do
    get iventory_product_url(@iventory_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_iventory_product_url(@iventory_product)
    assert_response :success
  end

  test "should update iventory_product" do
    patch iventory_product_url(@iventory_product), params: { iventory_product: { product_id: @iventory_product.product_id, quantity: @iventory_product.quantity } }
    assert_redirected_to iventory_product_url(@iventory_product)
  end

  test "should destroy iventory_product" do
    assert_difference('IventoryProduct.count', -1) do
      delete iventory_product_url(@iventory_product)
    end

    assert_redirected_to iventory_products_url
  end
end
