module UsersHelper
  def login_message
    html = '<div>'
    
    if flash[:status] == true
      html += flash[:alert]
    elsif flash[:status] == false
      flash[:alert].each do |error|
        html += error
      end
    end
    html += '</div>'
    
    return html.html_safe
  end
end
