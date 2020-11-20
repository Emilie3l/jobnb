class JobApplicationsController < ApplicationController
  before_action :set_job, only: [:new, :create]
  before_action :set_job_application, only: [:destroy]

  def new
  end
  
  def create
    if params[:job_application]
      @job_application = JobApplication.new(job_application_params)
    else
      @job_application = JobApplication.new
    end

    @job_application.job = @job
    
    @job_application.applicant = current_user
    
    if @job_application.save
      flash[:notice] = "Your application has been submited. Have a nice day!"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def destroy
    @job = @job_application.job
    @job_application.destroy
    redirect_to job_path(@job)
  end

  private
  
  def job_application_params
    params.require(:job_application).permit(:cv)
  end
  
  def set_job
    @job = Job.find(params[:job_id])
    @job_application = JobApplication.new

    @job_application.applicant = current_user
    @job_application.job = @job

    authorize @job_application
  end

  def set_job_application
    @job_application = JobApplication.find(params[:id])

    authorize @job_application
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to job_path(@job_application.job)
  end  

end
