require 'test_helper'

class UserProfileTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "redirect to sign in if logged out" do
    get user_path(users(:michael))
    follow_redirect!
    assert_template 'devise/sessions/new'
  end

  test "show own user page if logged in" do
    sign_in users(:michael)
    get user_path(users(:michael))
    assert_template 'users/show'
  end

  test "show other user page if logged in" do
    sign_in users(:michael)
    get user_path(users(:archer))
    assert_template 'users/show'
  end
end
