class PostsController < ApplicationController
	before_action :user_signed_in?, only: [:create, :destroy, :show]
  before_action :correct_user, only: :destroy

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "post deleted"
    redirect_to current_user
  end

  def show
  	@post=Post.find(params[:id])
  	@user=@post.user
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
