class ResumesController < ApplicationController
	def new
		@job = Job.find(params[:job_id])
		@resume = Resume.new
	end

	def create
		@job = Job.find(params[:job_id])
		@resume = Resume.new(resume_params)
		@resume.user = current_user
		@resume.job = @job
		if @resume.save
			redirect_to jobs_path
		else
			render :new
		end
	end

	private

	def resume_params
		params.require(:resume).permit(:content)
	end
end
