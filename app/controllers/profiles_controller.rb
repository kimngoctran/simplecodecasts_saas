class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_current_user
    
  def new
    # form where user can fill out their OWN profile
    @user = User.find(params[:user_id] )
    @profile = Profile.new
  end
  def create
    @user = User.find(params[:user_id])
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile Updated"
      redirect_to user_path(params[:user_id])
    else
      render action: :new
    end
  end
  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end
  def update
    @user = User.find(params[:user_id])
    @profile =@user.profile
    if @profile.update_attributes(profile_params)
      flash[:success]= "Profile Updated!"
      redirect_to user_path(params[:user_id])
    else
      render action: :edit
    end
  end  
  #from validation: rules that require users to fill out fields before he can submit it
  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
  end
  def only_current_user
    @user = User.find(params[:user_id])
    redirect_to root_path unless @user == current_user
  end
end
