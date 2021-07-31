require "application_system_test_case"

class BalancesTest < ApplicationSystemTestCase
  setup do
    @balance = balances(:one)
  end

  test "visiting the index" do
    visit balances_url
    assert_selector "h1", text: "Balances"
  end

  test "creating a Balance" do
    visit balances_url
    click_on "New Balance"

    fill_in "Price per unity", with: @balance.price_per_unity
    fill_in "Product", with: @balance.product_id
    fill_in "Quantity", with: @balance.quantity
    fill_in "User", with: @balance.user_id
    click_on "Create Balance"

    assert_text "Balance was successfully created"
    click_on "Back"
  end

  test "updating a Balance" do
    visit balances_url
    click_on "Edit", match: :first

    fill_in "Price per unity", with: @balance.price_per_unity
    fill_in "Product", with: @balance.product_id
    fill_in "Quantity", with: @balance.quantity
    fill_in "User", with: @balance.user_id
    click_on "Update Balance"

    assert_text "Balance was successfully updated"
    click_on "Back"
  end

  test "destroying a Balance" do
    visit balances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Balance was successfully destroyed"
  end
end
