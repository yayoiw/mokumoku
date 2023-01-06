# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    @other_user = User.find(params[:follower])
    current_user.follow(@other_user)
    redirect_back fallback_location: root_path
  end

  def destroy
    @relationship = current_user.relationships.find(params[:id])
    current_user.unfollow(@relationship.id)
    redirect_back fallback_location: root_path
  end
end
