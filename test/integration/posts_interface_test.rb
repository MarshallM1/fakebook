require 'test_helper'

class PostsInterfaceTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers

  test "micropost interface" do
  	@user = users(:michael)
  	sign_in @user
    get user_path(@user)
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Post.count' do
      post posts_path, params: {post: { content: "" } }
    end
    # Valid submission
    content = "This micropost really ties the room together"
    assert_difference 'Post.count', 1 do
      post posts_path, params: { post: { content: content } }
    end
    assert_redirected_to user_path(users(:michael))
    follow_redirect!
    assert_match content, response.body
    # Delete post
    assert_select 'a', text: 'delete post'
    first_post = @user.posts.paginate(page: 1).first
    assert_difference 'Post.count', -1 do
      delete post_path(first_post)
    end
    # Visit different user (no delete links)
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
end
