class Image
  include Mongoid::Document
  include Mongoid::Paperclip
  # has_mongoid_attached_file :post_image
  # validates_attachment_content_type :post_image, description_type: /\Aimage\/.*\Z/
  has_mongoid_attached_file :image
  
end
