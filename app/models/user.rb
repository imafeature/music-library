class User < ActiveRecord::Base
  attr_accessor :password	
  attr_accessible :username, :email, :password, :password_confirmation
  
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates :fname, :lname, :format => {:with => %r{^[a-zA-Z]+$}, :multiline => true, :message => ' can consist only of alphabetic characters'}, :allow_blank => true
  validates_length_of :password, :in => 6..20, :on => :create

  has_and_belongs_to_many :labels, :albums, :artists, :autosave => true

  before_save :encrypt_password
	after_save :clear_password

	def encrypt_password
	  if password.present?
	    salt = BCrypt::Engine.generate_salt
			encrypted_password = BCrypt::Engine.hash_secret(password, salt)
	  end
	end
	def clear_password
	  self.password = nil
	end
end
