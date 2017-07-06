class UsersController < ApplicationController

	def show
		@user=User.find(params[:id])
		@posts = @user.posts.paginate(page: params[:page])
		@post  = current_user.posts.build
	end

	def index
		@users = User.paginate(page: params[:page])
	end
end
