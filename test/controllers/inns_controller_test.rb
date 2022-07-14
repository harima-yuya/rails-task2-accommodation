require 'test_helper'

class InnsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inns_index_url
    assert_response :success
  end

  test "should get add" do
    get inns_add_url
    assert_response :success
  end

  test "should get edit" do
    get inns_edit_url
    assert_response :success
  end

  test "should get search" do
    get inns_search_url
    assert_response :success
  end

  test "should get show" do
    get inns_show_url
    assert_response :success
  end

  test "should get registrationRoom" do
    get inns_registrationRoom_url
    assert_response :success
  end

end
