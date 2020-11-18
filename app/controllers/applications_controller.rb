class ApplicationsController < ApplicationController
  before_action :set_job, only: [:new, :create]

  def new
    @application = Application.new
    @application.job = @job
    @application.applicant = current_user
  end
  
  def create
    if params[:application]
      @application = Application.new(application_params)
    else
      @application = Application.new
    end
    
    @application.job = @job
    @application.applicant = current_user
    
    if @application.save
      flash[:notice] = "Your application has been submited. Have a nice day!"
      redirect_to job_path(@job)
    else
      render :new
    end
  end
  
  private
  
  def application_params
    params.require(:application).permit(:cv)
  end
  
  def set_job
    @job = Job.find(params[:job_id])
  end
end
