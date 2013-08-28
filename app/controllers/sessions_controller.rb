class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.authenticate(params[:session][:username], params[:session][:password])
    
    if user
      sign_in_check user #session[:user_id] = user.id
      redirect_to root_path, :notice => "logged in"
    else
      flash.now.alert = "Invalid username or password"
      render 'new'
    end
    
  end
  
  def destroy
    session[:user_id] = nil
    session[:username] = nil
    redirect_to root_path, :notice => "logged out"
  end
  
end
