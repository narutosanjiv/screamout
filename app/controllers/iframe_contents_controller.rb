class IframeContentsController < ApplicationController
  layout 'iframe_application'
  def new

    @content = Content.new
    con = {}
    
  end

  def create
    @content = Content.new(content_params_input)
    @content.image_file_name = @content.title

    if @content.save 
      ImageWorker.perform_async(@content.id.to_s)  
      respond_to do |format|
        format.html {redirect_to contents_path}
      end
    else
      respond_to do |format| 
        format.html { render action: 'new' }        
      end
    end
  end

  private
  
    def content_params_input
      params.require(:content).permit(:url,:photo, :title, :tags, :rates, :user_id)
    end
end
