require 'test_helper'

class FriendingTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers

	def setup
    @user = users(:michael)
    @other = users(:archer)
    sign_in(@user)
  end

  test "add friend" do
  	get user_path(@other)
  	assert_match @other.friends.count.to_s, response.body
  	assert_match "Add Friend", response.body
  	assert_no_difference '@user.friends.count' do
      @friendship = @user.friendships.build(friend_id: @other.id)
			@friendship.save
    end
  	sign_in(@other)
  	get friendships_path
  	assert_match "Friend Requests (#{@other.requested_friendships.count})", response.body
  	assert_match "#{@user.first_name} #{@user.last_name}", response.body
  	@friendship.update_attributes(accepted: true)
  	# check friends show page for successful friendship
  	get show_friends_user_path(@other)
  	assert_match "Friend Requests (#{@other.requested_friendships.count})", response.body
  	assert_match "#{@user.first_name} #{@user.last_name}", response.body
  	get show_friends_user_path(@user)
  	assert_match "#{@user.first_name} #{@user.last_name}", response.body

  end

end
