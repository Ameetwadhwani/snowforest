class ApplicationController < ActionController::Base
  protect_from_forgery


def current_user
	@current_user ||= User.find(session[:user_id]) if session[:user_id]
end

helper_method :current_user

  def ensure_logged_in
	  unless current_user
		  flash[:alert] = "Hey-yo... you gotta be logged in to review the reviews. Lame, I know, but still..."
		  redirect_to new_session_path
	  end
  end

end

