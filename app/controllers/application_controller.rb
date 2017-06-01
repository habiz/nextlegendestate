class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # session storage
  include SessionsHelper
  #def hello
  #  render text: 'hello world!'
  #end
  #confirmed a login user
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "please login"
      redirect_to login_url
    end
  end
end
