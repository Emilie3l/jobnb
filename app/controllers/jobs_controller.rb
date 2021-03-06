class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @jobs = policy_scope(Job)

    if params[:query].present?
      @jobs = Job.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @jobs = policy_scope(Job).order(deadline: :asc)
    end
  end

  def show
  end

  def new
    @job = Job.new
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    authorize @job

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
    params.require('job').permit(:title, :description, :pay, :start_date, :deadline, :banner_photo)
  end

  def set_job
    @job = Job.find(params[:id])
    authorize @job
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to job_path
  end

end
