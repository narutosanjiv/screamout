  class Content
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Taggable

  IMAGE_PATH = "#{Rails.root}/public/snapshots/"
  #IMAGE_WIDTH = 100
  #IMAGE_HEIGHT = 100
  
  field :title, type: String
  field :url, type: String
  field :image_file_name, type:String

	rateable range: (0..5)
  belongs_to :user
  validates :url, presence: true
  validates :url, format: {with: /(^$)|(^(http|https):\/\/[a-z0-9]+(\.{1}[a-z0-9]+)*\.[a-z]{2,5}[:]?(([0-9]{1,5})?\/.*)$)/i}

 def image_file_name=(title)
    self[:image_file_name]= title.gsub(" ","_") +"_"+ Time.now.to_i.to_s
  end
  
end