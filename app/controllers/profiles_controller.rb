class ProfilesController < ApplicationController
  def new
    # form where user can fill out their OWN profile
    @user = User.find(params[:user_id] )
    @profile = @user.build_profile
  end
end