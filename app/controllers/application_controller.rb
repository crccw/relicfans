class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from WechatError::NotValid, with: :access_denied

  def access_denied
    render text: "Access denied", status: :forbidden
  end
end
