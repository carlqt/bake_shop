class User < ActiveRecord::Base
  require 'digest/md5'
  
  attr_accessible :password_confirmation, :name, :email, :password, :username
  before_save :encrypt_password
  
  
  validates :name,  :presence => true,
                    :length => { :maximum => 25}

  validates :username,  :presence => true,
                        :length => { :maximum => 25,
                        :uniqueness => {:case_sensitive => false}}                    
                    
  validates :email, :presence => true,
                    :uniqueness => {:case_sensitive => false}
                    
  validates :password, :presence => true, 
            :confirmation => true,
            :length => {:within => 6..40}
            
  validates :password_confirmation, :presence => true
  
  def self.authenticate(username, password)
    user = find_by_username(username)
    
    if user && user.password == Digest::MD5.hexdigest(password)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    self.password = Digest::MD5.hexdigest(password)
  end
end
