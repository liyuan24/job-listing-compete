class Admin::ResumeController < ApplicationController
	def index
		@job = Job.find(params[:job_id])
		@resume = @job.resumes
	end
end
