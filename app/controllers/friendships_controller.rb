class FriendshipsController < ApplicationController
	before_action :user_signed_in?, only: [:create, :destroy, :update, :index]

  def create
  	@friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Friend requested."
      redirect_to :back
    else
      flash[:error] = "Unable to request friendship."
      redirect_to :back
    end
  end

  def update
  	@friendship = Friendship.find_by(id: params[:id])
    @friendship.update_attributes(accepted: true)
    if @friendship.save
      redirect_to root_url, notice: "Successfully confirmed friend!"
    else
      redirect_to root_url, notice: "Sorry! Could not confirm friend!"
    end
  end

  def destroy
  	@friendship = Friendship.find_by(id: params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to :back
  end

  def index
  	@requests = current_user.requested_friendships
  end
end