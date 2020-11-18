class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.employer = current_user

    if @job.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to job_path(@job)
    else
      render :edit
    end
  end
  
  def destroy
    @job.destroy
    redirect_to jobs_path
  end
  
  private
  
  def job_params
    params.require('job').permit(:title, :description, :pay, :start_date, :deadline)
  end
  
  def set_job
    @job = Job.find(params[:id])
  end
end
