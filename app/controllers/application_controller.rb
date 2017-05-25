class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  def current_user
    @user = User.find(session[:current_user_id]) if session[:current_user_id]
  end

  helper_method :current_user

  private
    def require_login
      if !session[:current_user_id]
        return redirect_to '/users/new'
      end
    end
end
