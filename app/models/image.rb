class Image
  include Mongoid::Document
  include Mongoid::Paperclip
  # has_mongoid_attached_file :post_image
  # validates_attachment_content_type :post_image, description_type: /\Aimage\/.*\Z/
  belongs_to :imageable, :polymorphic => true
  has_mongoid_attached_file :content, :style => { :medium => "300x300>", :thumb => "100x100>"}
  validates_attachment_content_type :content, :content_type => /\Aimage\/.*\Z/
end
