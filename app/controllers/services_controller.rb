class ServicesController < ApplicationController
	before_action :find_service, only: [:show, :edit, :update, :destroy]

	def index
		@services = Service.all.order("created_at DESC")
	end

	def show
	end

	def new
		@service = Service.new
	end

	def create
		@service = Service.new(service_params)
		
		if @service.save
			redirect_to @service
		else
			render "New"
		end
	end

	def edit
	end

	def update
		if @service.update(service_params)
			redirect_to @service
		else
			render 'Edit'
		end
	end

	def destroy
		@service.destroy
		redirect_to root_path
	end

	private

	def service_params
		params.require(:service).permit(:title, :description, :partner)
	end

	def find_service
		@service = Service.find(params[:id])
	end
	
end
