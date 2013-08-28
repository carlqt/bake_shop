module ApplicationHelper
  def user_name
    name = User.find(session[:user_id])
    name = name.name
  end



end
