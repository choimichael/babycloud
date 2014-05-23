class Post
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  belongs_to :user
  has_mongoid_attached_file :image,
  :styles => {
      :original => ['1920x1680>', :jpg, :convert_options => "-auto-orient", :quality => 100],
      :large    => ['500x500>',   :jpg, :convert_options => "-auto-orient", :quality => 100]
    }
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, :attachment_presence => true
  

  def decide_style
    if image_content_type =~ %r{^(image|(x-)?application)/(bmp|jpeg|jpg|pjpeg|png|x-png)$}
      "500x500>"
    else
      false
    end
  end
end
