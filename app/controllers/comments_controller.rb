class CommentsController < ApplicationController
	before_action :correct_user, only: :destroy

	def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_back(fallback_location: root_path)
    else
      redirect_to :root
    end
	end

	def destroy
		@comment = Comment.find_by(post_id: params[:id], user_id: current_user.id)
    if @comment.destroy
      flash[:success] = "You have removed your comment!"
    end
    redirect_to :root
	end

	private

		def comment_params
			params.require(:comment).permit(:body, :post_id)
		end

		def correct_user
      @comment = current_user.comments.find_by(post_id: params[:id], user_id: current_user.id)
      redirect_to root_url if @comment.nil?
    end
end