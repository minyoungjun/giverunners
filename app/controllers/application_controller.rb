class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_login

    if !(user_signed_in?)
      redirect_to "/users/auth/facebook"
    end
  end
  def is_admin

    if current_user.email != "minyoung9353@nate.com" && current_user.email != "bigtory.kim@gmail.com"
      redirect_to "/users/auth/facebook"
    end
  end
end
