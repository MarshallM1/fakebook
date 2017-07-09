require 'test_helper'

class LikesTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:michael)
    @other = users(:archer)
    sign_in(@user)
  end

  test "like another users post" do
  	get user_path(@other)
  	assert_match "Like", response.body
  	#like the post
  	@post = @other.posts.last
  	@post.likes.create(user_id: @user.id)
  	get user_path(@other)
  	assert_match "has liked this post", response.body
  	assert_match "Unlike", response.body
  	assert @post.likes.count == 1
  end
end
