class ContentsController < ApplicationController

  
	def index
		@contents = Content.all.desc(:created_at)		
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
	    @content = Content.new(content_params_input)
	    @content.image_file_name = @content.title

	    if @content.valid?
	    	@content.save
	    	ImageWorker.perform_async(@content.id.to_s)  
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
		@content = Content.where(id: params[:id]).first

		if @content.destroy
			redirect_to contents_path
		else
      #flash[:notice] = ' not deleted'
			flash.now[:error] = @content.errors.messages
      render action: 'index'
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
		params.require(:content).permit(:url,:photo, :title, :tags, :rates, :user_id)
	end
	def tags_to_hash(cons)
		cons.map do |con|
			{id: con, name: con}
		end		
	end
end
