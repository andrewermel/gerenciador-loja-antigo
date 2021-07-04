require "application_system_test_case"

class ReceitaTest < ApplicationSystemTestCase
  setup do
    @receitum = receita(:one)
  end

  test "visiting the index" do
    visit receita_url
    assert_selector "h1", text: "Receita"
  end

  test "creating a Receitum" do
    visit receita_url
    click_on "New Receitum"

    fill_in "Valor", with: @receitum.valor
    click_on "Create Receitum"

    assert_text "Receitum was successfully created"
    click_on "Back"
  end

  test "updating a Receitum" do
    visit receita_url
    click_on "Edit", match: :first

    fill_in "Valor", with: @receitum.valor
    click_on "Update Receitum"

    assert_text "Receitum was successfully updated"
    click_on "Back"
  end

  test "destroying a Receitum" do
    visit receita_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Receitum was successfully destroyed"
  end
end
