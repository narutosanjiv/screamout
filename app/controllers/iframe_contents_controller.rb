class IframeContentsController < ApplicationController
  layout 'iframe_application'
  def new
    @content = Content.new
    @con = []
  end

  def create
    @content = Content.new(content_input_params)
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
  def content_input_params
    params.require(:content).permit(:url, :title)
  end
end