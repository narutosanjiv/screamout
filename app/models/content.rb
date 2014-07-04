  
  class Content
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Taggable
  include Mongoid::Paperclip

  IMAGE_PATH = "#{Rails.root}/public/snapshots/"
  #IMAGE_WIDTH = 100
  IMAGE_HEIGHT = 400
  
  field :title, type: String
  field :url, type: String
  field :image_file_name, type:String
  has_mongoid_attached_file :photo,:styles => {:original => ['1920x1680>', :jpg],:small    => ['150x150>',   :jpg]}  

  rateable range: (0..5)
  belongs_to :user
  #validates :title, presence: true
  validates :url, presence: true, uniqueness: true, format: { with: /(^$)|(^(http|https):\/\/[a-z0-9]+(\.{1}[a-z0-9]+)*\.[a-z]{2,5}[:]?(([0-9]{1,5})?\/.*)$)/i}
  validates :image_file_name, presence: true
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "application/pdf"]

 
  def image_file_name=(title)
    self[:image_file_name]= title.gsub(" ","_") +"_"+ Time.now.to_i.to_s + ".jpg"
  end
  
end
