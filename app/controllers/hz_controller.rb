class HzController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	layout "hz"
	def index
		@jobs = order_params
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
			redirect_to hz_index_path, notice: "Create a new job"
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
			redirect_to hz_index_path, notice: "Update successfully"
		else
			render :edit
		end
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to hz_index_path, alert: "Job deleted"
	end

	private

	def job_params
		params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :location, :field)
	end

	def order_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:location => "杭州").published.order("wage_upper_bound DESC").paginate(:page => params[:page], :per_page => 10)
		when "wage_lower_bound"
			Job.where(:location => "杭州").published.order("wage_lower_bound DESC").paginate(:page => params[:page], :per_page => 10)
		else
			Job.where(:location => "杭州").published.recent.paginate(:page => params[:page], :per_page => 10)
		end
	end
end
