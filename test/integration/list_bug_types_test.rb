require 'test_helper'

class ListBugTypesTest < ActionDispatch::IntegrationTest
  def setup
    @bug_type = BugType.create(name: "Crickets")
    @bug_type_2 = BugType.create(name: "Meal Worms")
  end

  test "should show bug types listing" do 
    get '/bug_types'
    assert_select "a[href=?]", bug_type_path(@bug_type), text: @bug_type.name
    assert_select "a[href=?]", bug_type_path(@bug_type_2), text: @bug_type_2.name
  end
end
