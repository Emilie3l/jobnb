class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to job_path
  end  
end
