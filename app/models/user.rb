class User < ActiveRecord::Base
  attr_accessor :password	

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => {:with => EMAIL_REGEX, :multiline => true}
  validates :password, :presence =>true, :confirmation => true #password_confirmation attr
  validates :fname, :lname, :format => {:with => %r{^[a-zA-Z]+$}, :multiline => true, :message => ' can consist only of alphabetic characters'}, :allow_blank => true
  validates_length_of :password, :in => 6..20, :on => :create

  has_and_belongs_to_many :labels, :autosave => true
  has_and_belongs_to_many :albums, :autosave => true 
  has_and_belongs_to_many :artists, :autosave => true

  before_save :encrypt_password
	after_save :clear_password

	def encrypt_password
	  if password.present?
	    salt= Digest::SHA1.hexdigest("# We add {email} as unique value and #{Time.now} as random value")
			encrypted_password= Digest::SHA1.hexdigest("Adding #{salt} to {password}")
	  end
	end

	def clear_password
	  self.password = nil
	end

end
