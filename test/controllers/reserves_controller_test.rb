require 'test_helper'

class ReservesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reserves_index_url
    assert_response :success
  end

  test "should get add" do
    get reserves_add_url
    assert_response :success
  end

  test "should get confrim" do
    get reserves_confrim_url
    assert_response :success
  end

  test "should get complete" do
    get reserves_complete_url
    assert_response :success
  end

end
