class PagesController < ApplicationController
  
  before_filter :checklogin, :only => [:products]
  
  def home
    @gender = params[:gender]
    @email = params[:email]
  end
  
  def services
    @users = User.all
    @column_names = User.column_names
  end
  
  def menu
    
  end
  
  def products
    
  end
end
