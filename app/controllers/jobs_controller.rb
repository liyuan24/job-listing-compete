class JobsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_action :validates_search_key, only: [:search]
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
			redirect_to jobs_path, notice: "Create a new job"
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
			redirect_to jobs_path, notice: "Update successfully"
		else
			render :edit
		end
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to jobs_path, alert: "Job deleted"
	end

	def it
		@jobs = it_params
	end

	def estate
		@jobs = estate_params
	end

	def finance
		@jobs = finance_params
	end

	def consumption
		@jobs = consumption_params
	end

	def manufacture
		@jobs = manufacture_params
	end

	def chemistry
		@jobs = chemistry_params
	end

	def search
		if @query_string.present?
			@jobs = search_params
		end
	end

	protected

	def validates_search_key
		@query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
	end

	private

	def job_params
		params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :location, :field)
	end

	def order_params
		case params[:order]
		when "wage_upper_bound"
			Job.published.order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.published.order("wage_lower_bound DESC")
		else
			Job.published
		end
	end

	def it_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:field => "互联网").published.order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.where(:field => "互联网").published.order("wage_lower_bound DESC")
		else
			Job.where(:field => "互联网").published
		end
	end

	def finance_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:field => "金融").published.order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.where(:field => "金融").published.order("wage_lower_bound DESC")
		else
			Job.where(:field => "金融").published
		end
	end

	def estate_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:field => "房地产").published.order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.where(:field => "房地产").published.order("wage_lower_bound DESC")
		else
			Job.where(:field => "房地产").published
		end
	end

	def consumption_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:field => "消费品").published.order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.where(:field => "消费品").published.order("wage_lower_bound DESC")
		else
			Job.where(:field => "消费品").published
		end
	end

	def chemistry_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:field => "化工").published.order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.where(:field => "化工").published.order("wage_lower_bound DESC")
		else
			Job.where(:field => "化工").published
		end
	end

	def manufacture_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:field => "制造").published.order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.where(:field => "制造").published.order("wage_lower_bound DESC")
		else
			Job.where(:field => "制造").published
		end
	end

	def search_params
		case params[:order]
		when "wage_upper_bound"
			Job.ransack({:title_or_field_or_location_or_company_name_cont => @query_string}).result(distinct: true).published.order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.ransack({:title_or_field_or_location_or_company_name_cont => @query_string}).result(distinct: true).published.order("wage_lower_bound DESC")
		else
			Job.ransack({:title_or_field_or_location_or_company_name_cont => @query_string}).result(distinct: true).published
		end
	end
end
