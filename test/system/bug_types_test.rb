require "application_system_test_case"

class BugTypesTest < ApplicationSystemTestCase
  setup do
    @bug_type = bug_types(:one)
  end

  test "visiting the index" do
    visit bug_types_url
    assert_selector "h1", text: "Bug Types"
  end

  test "creating a Bug type" do
    visit bug_types_url
    click_on "New Bug Type"

    click_on "Create Bug type"

    assert_text "Bug type was successfully created"
    click_on "Back"
  end

  test "updating a Bug type" do
    visit bug_types_url
    click_on "Edit", match: :first

    click_on "Update Bug type"

    assert_text "Bug type was successfully updated"
    click_on "Back"
  end

  test "destroying a Bug type" do
    visit bug_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bug type was successfully destroyed"
  end
end
