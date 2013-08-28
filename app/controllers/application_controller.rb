class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :check_login
  
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
        flash[:alert] = "You need to be login first"
        
        redirect_to user_login_path
      end
  end


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
end
