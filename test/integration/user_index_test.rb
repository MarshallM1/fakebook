require 'test_helper'

class UserIndexTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers

	test "redirect to sign in if logged out" do
    get users_path
    follow_redirect!
    assert_template 'devise/sessions/new'
  end

  test "index logged in including pagination" do
    sign_in users(:michael)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: "#{user.first_name} #{user.last_name}"
    end
  end

end
