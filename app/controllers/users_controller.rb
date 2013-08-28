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
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      redirect_to pages_services_path, :notice => "Update Successful"
    else
      render "edit"
    end
  end  
  
  def show
    @profile = User.find(params[:id])
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to pages_services_path, :notice => "Delete Successful"
  end
  
end
