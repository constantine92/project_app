require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.create(username: "test", email: "test@example.com")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
   test "name should be present" do
    @user.username = "     "
    assert_not @user.valid?
  end
  
end
