require 'test_helper'

class BugTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bug_type = BugType.create(name: "Cricket")
    @admin_user = User.create(username: "johndoe", email: "johndoe@example.com", 
                              password: "password", admin: true)
  end

  test "should get index" do
    get bug_types_url
    assert_response :success
  end

  test "should get new" do
    get new_bug_type_url
    assert_response :success
  end

  test "should create bug type" do
    assert_difference('BugType.count', 1) do
      post bug_types_url, params: { bug_type: { name: "Mealworm" } }
    end

    assert_redirected_to bug_type_url(BugType.last)
  end

  test "should show bug_type" do
    get bug_type_url(@bug_type)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_bug_type_url(@bug_type)
  #   assert_response :success
  # end

  # test "should update bug_type" do
  #   patch bug_type_url(@bug_type), params: { bug_type: {  } }
  #   assert_redirected_to bug_type_url(@bug_type)
  # end

  # test "should destroy bug_type" do
  #   assert_difference('BugType.count', -1) do
  #     delete bug_type_url(@bug_type)
  #   end

  #   assert_redirected_to bug_types_url
  # end
end
