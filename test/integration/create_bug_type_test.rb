require 'test_helper'

class CreateBugTypeTest < ActionDispatch::IntegrationTest
  
  test "get new bug_type form and create bug_type" do
    get "/bug_types/new"
    assert_response :success
    assert_difference 'BugType.count', 1 do
      post bug_types_path, params: { bug_type:  { name: "Tarantulas"} }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Tarantulas", response.body
  end

  test "get new bug_type form and reject invalid bugtype submission" do 
    get "/bug_types/new"
    assert_response :success
    assert_no_difference 'BugType.count' do 
      post bug_types_path, params: { bug_type: { name: " " } }
    end
    assert_match "errors", response.body 
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end
end
