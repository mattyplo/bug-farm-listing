require 'test_helper'

class BugTypeTest < ActiveSupport::TestCase

  def setup
    @bug_type = BugType.new(name: "Cricket")
  end

  test "bug type should be valid" do
    assert @bug_type.valid?
  end

  test "name should be present" do
    @bug_type.name = " "
    assert_not @bug_type.valid?
  end

  test "name should be unique" do 
    @bug_type.save
    @bug_type_2 = BugType.new(name: "Cricket")
    assert_not @bug_type_2.valid?
  end

  test "name should not be too long" do 
    @bug_type.name = "a" * 51
    assert_not @bug_type.valid?
  end

  test "name should not be too short" do 
    @bug_type.name = "aa"
    assert_not @bug_type.valid?
  end
end