class ApplicationsController < ApplicationController
  def new
    @application = Application.new
    @job = Job.find(params[:job_id])
  end

  def create
    @job = Job.find(params[:job_id])
    @application = Application.new(application_params)
    @application.job = @job

    if @application.save
      redirect_to application_path(@application)
    else
      render :new
    end
  end

  private

  def application_params
    params.require('application').permit(:job_id, :user_id)
  end
end
