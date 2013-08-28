class UsersController < ApplicationController
 
  def new
    @user = User.new
    @title = "User Sign Up"    
  end
  
  def create
    
    @user = User.new(params[:user])
    
    
    if @user.save
      #flash[:status] = true
      #flash[:alert] = "You have successfully signed up!!"
      
      sign_in_check @user
      redirect_to root_path, :flash => { :success => "Welcome to the Bakeshop"}
    else
      @title = "User Sign Up" 
      render 'new'
    end  
  end
end
