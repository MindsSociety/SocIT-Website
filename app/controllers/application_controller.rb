class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  @@allowed_parameters = [:name, :username, :student_number, :email,
                          :phone_number, :email_opt_in, :home_directory,
                          :password, :password_confirmation, :current_password]
end
