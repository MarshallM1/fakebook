require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers

  test "layout links not signed in" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", new_user_session_path
    assert_select "a[href=?]", new_user_registration_path
  end

  test "layout links signed in" do
  	sign_in users(:michael)
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", destroy_user_session_path
  end
end