class ImageWorker
	include Sidekiq::Worker

	def perform(content_id)
			content = Content.find(content_id)
			kit = IMGKit.new(content.url)
	    #kit.stylesheets << '/path/to/css/file'
	    img = kit.to_img(:jpg)
	    file = kit.to_file(Content::IMAGE_PATH + content.image_file_name)	
	end
end