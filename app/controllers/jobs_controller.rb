class JobsController < ApplicationController
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

    if @job.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy
    redirect_to jobs_path
  end

  private

  def job_params
    params.require('job').permit(:title, :description, :pay, :start_date, :deadline)
  end
end
