require 'test_helper'

class CommentsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:michael)
    @other = users(:archer)
    @post = @other.posts.last
    sign_in(@user)
  end

  test "comment on another users post" do
  	get user_path(@other)
  	assert_match "Comment", response.body
  	
  	@post.comments.create(user_id: @user.id, body: "Test comment")
  	get user_path(@other)
  	assert_match "View Comments (#{@post.comments.count})", response.body
  	assert @post.comments.count == 1
  	get post_path(@post)
  	assert_match "Test comment", response.body
  end

end
