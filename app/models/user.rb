
class User < ApplicationRecord
 
	attr_accessor :password

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create

  before_save :encrypt_password
  after_save :clear_password


  def self.authenticate(username_or_email="",login_password="")
    if EMAIL_REGEX.match(username_or_email)
      @user = User.find_by_email(username_or_email)
    else
      @user = User.find_by_username(username_or_email)
    end
    
    if @user && match_password(login_password)
      return @user
    else
      return false
    end
  end

private
  def self.match_password(login_password="")
    return true
  end

private
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
