# frozen_string_literal: true

class JobsController < ProtectedController
  before_action :set_job, only: [:show, :update, :destroy]

  # GET /jobs
  def index
    @jobs = current_user.jobs

    render json: @jobs
  end

  # GET /jobs/1
  def show
    render json: @job
  end

  # POST /jobs
  def create
    @job = current_user.jobs.build(job_params)

    if @job.save
      render json: @job, status: :created, location: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = current_user.jobs.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
  def job_params
    params.require(:job).permit(:task, :completed)
  end
end
