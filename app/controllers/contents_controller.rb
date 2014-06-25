class ContentsController < ApplicationController
	def index
		@contents = Content.all
	end
	def show
	end
	def new
		@content = Content.new
	end
	def create
		@content = Content.new(content_params_input)
		if @content.save
			redirect_to contents_path
		else
			render action: 'new'
		end
	end
	def edit
		@content = Content.find(params[:id])
	end
	def delete
	end
	def update
		@content = Content.find(params[:id])
		if @content.update_attributes(content_params_input)
			redirect_to contents_path
		else
			render action: 'edit'
		end
	end
	private
	def content_params_input
		params.require(:content).permit(:url, :image_file_name, :tags, :rates, :user_id)
	end
end
