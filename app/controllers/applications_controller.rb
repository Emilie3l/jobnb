class ApplicationsController < ApplicationController
  before_action :set_application, only: [:new, :create]

  def new
  end
  
  def create
    if @application.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end
  
  private
  
  def application_params
    params.require('Parameters').permit(:cv)
  end
  
  def set_application
    @application = Application.new
    @job = Job.find(params[:job_id])
    @application.job = @job
    @application.applicant = current_user
  end
end
