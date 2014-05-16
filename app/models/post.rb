class Post
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  belongs_to :user
  # has_mongoid_attached_file :image
  has_many :images, :as => :imageable, dependent: :destroy
  accepts_nested_attributes_for :images
end
