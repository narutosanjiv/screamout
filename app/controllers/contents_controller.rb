class ContentsController < ApplicationController

	def index
		@contents = Content.all
		
	end

	def show
		@content = Content.find(params[:id])
	end

	def new
		@content = Content.new
		@con = Content.new
		@con = []
	end

	def create
	    @content = Content.new(content_params)
	    @content.image_file_name = @content.title
	    
	      ImageWorker.perform_async(@content.id.to_s)  
	    
	    if @content.save
	      redirect_to contents_path
	    else
	      render action: 'new'
	    end
	end

	def edit
		@content = Content.find(params[:id])
		@con = @content.tags.split(",")
		@con = tags_to_hash(@con)
	end

	def destroy
		@content = Content.find(params[:id])
		if @content.destroy
			redirect_to contents_path
		else
			render action: 'new'
		end
	end
	

	def update
		@content = Content.find(params[:id])
		@con = @content.tags.split(",")
		@con = tags_to_hash(@con)
		if @content.update_attributes(content_params_input)
			redirect_to contents_path
		else
			render action: 'edit'
		end
	end

	def tags
		@cons = Content.tags
		respond_to do |format|
			format.html
			format.json { render json: tags_to_hash(@cons)}
		end
	end
	
	private
	def content_params_input
		params.require(:content).permit(:url, :image_file_name, :tags, :rates, :user_id)
	end
	def tags_to_hash(cons)
		cons.map do |con|
			{id: con, name: con}
		end		
	end
end
