class Admin::JobsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_is_admin
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
		@job = Job.create(job_params)
		if @job.save
			redirect_to admin_jobs_path, notice: "Create a new job"
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
			redirect_to admin_jobs_path, notice: "Update successfully"
		else
			render :edit
		end
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to admin_jobs_path, alert: "Job deleted"
	end

	def publish
		@job = Job.find(params[:id])
		@job.publish!
		redirect_to admin_jobs_path
	end

	def hide
		@job = Job.find(params[:id])
		@job.hide!
		redirect_to admin_jobs_path
	end

	private

	def job_params
		params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :location, :field)
	end

	def require_is_admin
		if !current_user.admin?
			redirect_to root_path
		end
	end
end
