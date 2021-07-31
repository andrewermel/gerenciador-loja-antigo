require "application_system_test_case"

class IventoryProductsTest < ApplicationSystemTestCase
  setup do
    @iventory_product = iventory_products(:one)
  end

  test "visiting the index" do
    visit iventory_products_url
    assert_selector "h1", text: "Iventory Products"
  end

  test "creating a Iventory product" do
    visit iventory_products_url
    click_on "New Iventory Product"

    fill_in "Product", with: @iventory_product.product_id
    fill_in "Quantity", with: @iventory_product.quantity
    click_on "Create Iventory product"

    assert_text "Iventory product was successfully created"
    click_on "Back"
  end

  test "updating a Iventory product" do
    visit iventory_products_url
    click_on "Edit", match: :first

    fill_in "Product", with: @iventory_product.product_id
    fill_in "Quantity", with: @iventory_product.quantity
    click_on "Update Iventory product"

    assert_text "Iventory product was successfully updated"
    click_on "Back"
  end

  test "destroying a Iventory product" do
    visit iventory_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Iventory product was successfully destroyed"
  end
end
