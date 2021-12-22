class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:relationship][:follower_id])
    following = current_user.follow(user)
    following.save
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:relationship][:follower_id])
    following = current_user.unfollow(user)
    following.destroy
    redirect_to request.referer
  end
end