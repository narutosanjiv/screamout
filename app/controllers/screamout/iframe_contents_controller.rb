module Screamout
  class IframeContentsController < ApplicationController
    layout 'screamout/iframe_application'
    def new
      @content = Content.new
      @tags_hash = Content.get_all_tags
    end

    def create
      @content = Content.new(content_params_input)
      @content.image_file_name = @content.title
      user ||= try(:current_user)
      @content.user = user
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
      params.require(:content).permit(:url,:photo, :title, :tags, :rates)
    end
  end
end
