class Admin::JobsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_is_admin
	layout "admin"
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

	def it
		@jobs = it_order_params
	end

	def estate
		@jobs = estate_order_params
	end

	def finance
		@jobs = finance_order_params
	end

	def consumption
		@jobs = consumption_order_params
	end

	def manufacture
		@jobs = manufacture_order_params
	end

	def chemistry
		@jobs = chemistry_order_params
	end

	def bj
		@jobs = bj_order_params
	end

	def sh
		@jobs = sh_order_params
	end

	def sz
		@jobs = sz_order_params
	end

	def gz
		@jobs = gz_order_params
	end

	def hz
		@jobs = hz_order_params
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

	def order_params
		case params[:order]
		when "wage_upper_bound"
			Job.all.order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.all.order("wage_lower_bound DESC")
		else
			Job.all.recent
		end
	end

	def it_order_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:field => "互联网").order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.where(:field => "互联网").order("wage_lower_bound DESC")
		else
			Job.where(:field => "互联网").recent
		end
	end

	def finance_order_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:field => "金融").order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.where(:field => "金融").order("wage_lower_bound DESC")
		else
			Job.where(:field => "金融").recent
		end
	end

	def manufacture_order_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:field => "制造").order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.where(:field => "制造").order("wage_lower_bound DESC")
		else
			Job.where(:field => "制造").recent
		end
	end

	def consumption_order_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:field => "消费品").order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.where(:field => "消费品").order("wage_lower_bound DESC")
		else
			Job.where(:field => "消费品").recent
		end
	end

	def estate_order_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:field => "房地产").order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.where(:field => "房地产").order("wage_lower_bound DESC")
		else
			Job.where(:field => "房地产").recent
		end
	end

	def chemistry_order_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:field => "化工").order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.where(:field => "化工").order("wage_lower_bound DESC")
		else
			Job.where(:field => "化工").recent
		end
	end

	def bj_order_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:location => "北京").order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.where(:location => "北京").order("wage_lower_bound DESC")
		else
			Job.where(:location => "北京").recent
		end
	end

	def sh_order_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:location => "上海").order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.where(:location => "上海").order("wage_lower_bound DESC")
		else
			Job.where(:location => "上海").recent
		end
	end

	def sz_order_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:location => "深圳").order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.where(:location => "深圳").order("wage_lower_bound DESC")
		else
			Job.where(:location => "深圳").recent
		end
	end

	def gz_order_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:location => "广州").order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.where(:location => "广州").order("wage_lower_bound DESC")
		else
			Job.where(:location => "广州").recent
		end
	end

	def hz_order_params
		case params[:order]
		when "wage_upper_bound"
			Job.where(:location => "杭州").order("wage_upper_bound DESC")
		when "wage_lower_bound"
			Job.where(:location => "杭州").order("wage_lower_bound DESC")
		else
			Job.where(:location => "杭州").recent
		end
	end
end
