require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid submission form" do
    
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { username: '',
                                          email: 'foobar.com',
                                          password: 'dude',
                                          password_confirmation: 'some'
                                        }
                                }
    end
    
    assert_template 'users/new'
    assert_select 'div#error_explanation'
   # assert_select 'div.<CSS class for field with error>'    
  end
  
  test "valid submission form" do
    
    get signup_path
    assert_difference 'User.count', 1 do
      post signup_path, params: {user: {   username: 'exampleuser',
                                          email: 'exampleuser@example.com',
                                          password: 'password',
                                          password_confirmation: 'password'
                                        }
                                }
    end
    
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.FILL_IN
  end
  
  
end
