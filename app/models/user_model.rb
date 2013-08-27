class UserModel < ActiveRecord::Base
  attr_accessible :name, :username, :email
end
