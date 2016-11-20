require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "should get contact" do
    get contact_path
    assert_response :success
  end

  test "should get about" do
    get about_path
    assert_response :success
  end

end
