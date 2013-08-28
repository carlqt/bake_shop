class PagesController < ApplicationController
  
  before_filter :checklogin, :only => [:products]
  
  def home
    @gender = params[:gender]
    @email = params[:email]
  end
  
  def help
    
  end
  
  def menu
    
  end
  
  def products
    
  end
end
