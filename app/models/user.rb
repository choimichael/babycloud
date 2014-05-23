require "bcrypt"
class User
  include Mongoid::Document
  include Mongoid::Paperclip
  # include Mongoid::Token

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  has_many :images
  has_many :posts
  has_mongoid_attached_file :images,
     :styles => {
      :original => ['1920x1680>', :jpg, :convert_options => "-auto-orient"],
      :small    => ['100x100#',   :jpg, :convert_options => "-auto-orient"],
      :medium   => ['250x250',    :jpg, :convert_options => "-auto-orient"],
      :large    => ['500x500>',   :jpg, :convert_options => "-auto-orient"]
    }
  

  validates :email, :name, uniqueness: :true, presence: :true

  def password
  	@password
  end

  def password=(new_password)
  	@password = new_password
  	self.password_digest = BCrypt::Password.create(new_password)
  end

  def authenticate(test_password)
  	if BCrypt::Password.new(self.password_digest) == test_password
  		self
  	else
  		false
  	end
  end
end
