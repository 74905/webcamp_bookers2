class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
     user_path(current_user.id)
  end
  

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me, :postcode, :prefecture_code, :addres_city, :addres_street, :address_building]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

 def book_params
  params.require(:book).permit(:title, :body)
 end

  def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
