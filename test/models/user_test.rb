require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.create(username: "test", email: "test@example.com",
                        password: "foobar", password_confirmation: "foobar")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
   test "name should be present" do
    @user.username = "     "
    assert_not @user.valid?
  end
  
  test "email should be present" do 
    @user.email = "     "
    assert_not @user.valid?
  end
  
  test "username should not be more than 50 characters" do 
    @user.username = "a"*51
    assert_not @user.valid?
  end
  
  test "email should not be more than 50 characters" do 
    @user.email = "a"*51 + "@example.com"
    assert_not @user.valid?
  end
  
  test "email format should be correct" do
    
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email format is incorrect" do
    
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should not be valid"
    end
  end
  
  test "email should be unique" do
  
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?, "email should be unique"
  
  end
  
  test "email should be downcase" do 
  
    mixed_email_case = "fOo@EmAiL.CoM"
    @user.email = mixed_email_case
    @user.save
    assert_equal mixed_email_case.downcase, @user.reload.email
  
  end
  
  test "password should not be blank" do
    @user.password = @user.password_confirmation = " "*6
    @user.save
    assert_not @user.valid?
  
  end
  
  test "password should have a minimum length" do 
    @user.password = @user.password_confirmation = "a"*5
    @user.save
    assert_not @user.valid?
  end
  
end
