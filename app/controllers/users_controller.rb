class UsersController < ApplicationController

	def show
		@user=User.find(params[:id])
		@posts = @user.posts.paginate(page: params[:page])
		@post  = current_user.posts.build
	end

	def index
		@users = User.paginate(page: params[:page])
	end

	def show_friends
		@user  = User.find(params[:id])
  	@friend_ids = @user.active_friends.ids
  	@friend_ids += @user.received_friends.ids
  	@friends = User.where(id: @friend_ids)
		@users = @friends.paginate(page: params[:page])
    render 'show_friends'
	end
end
