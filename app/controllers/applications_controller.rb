class ApplicationsController < ApplicationController
  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)

    if @application.save!
      redirect_to @application
    else
      render :new
    end
  end

  private

  def application_params
    params.require('application').permit(:job_id, :user_id)
  end
end
