require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get pofile" do
    get users_pofile_url
    assert_response :success
  end

  test "should get account" do
    get users_account_url
    assert_response :success
  end

end
