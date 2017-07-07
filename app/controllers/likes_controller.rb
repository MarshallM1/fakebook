class LikesController < ApplicationController

	def create
		@post = Post.find(params[:id])
		@post.likes.build(user_id: current_user.id)
		if @post.save
      flash[:success] = "You have liked this post!"
      redirect_back(fallback_location: root_path)
    else
      redirect_to :root
    end
	end

	def destroy
		@like = Like.find_by(post_id: params[:id], user_id: current_user.id)
    if @like.destroy
      flash[:success] = "You have unliked this post!"
    end
    redirect_to :root
	end

end