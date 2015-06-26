class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def index
    #Use.joints(:profile) to take only users who have profile. for more info, search Active Record Query Interface
    @users = User.all.joins(:profile)
  end
end
