class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  
  private
  def check_login
      if !session[:user_id]
        flash[:status] = FALSE
        flash[:alert] = "You need to be login first"
        
        redirect_to user_login_path
      else
        @user = User.find[session[:user_id]]
        $user_username = @user.username
      end
  end

  def checklogin
      if !current_user
        flash[:status] = FALSE
        flash[:alert] = "You need to be logged in first"
        
        redirect_to user_login_path
      end
  end


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def sign_in_check(user)
    #user = User.authenticate(user.username, user.password)
    #@tiago = user.username
    session[:user_id] = user.id
    session[:username] = user.username
    #session[:expires_at] = Time.now + 60.minutes
    request.session_options[:expire_after] = 2.minutes
  end 
  
end
