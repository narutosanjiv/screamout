class Content
  include Mongoid::Document
  include Mongoid::Taggable

  IMAGE_PATH = "#{Rails.root}/public/snapshots/"
  field :url, type: String
  field :image_file_name, type:String

	rateable range: (0..5)
  belongs_to :user
  validates :url, presence: true
  validates :url, format: {with: /(^$)|(^(http|https):\/\/[a-z0-9]+(\.{1}[a-z0-9]+)*\.[a-z]{2,5}[:]?(([0-9]{1,5})?\/.*)$)/i}

  
end