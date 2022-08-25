class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # redirect to users_index_path toguether with the root
  # get '/users' => "users#index", :as => :users_root in routes file
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || users_path
  end
end
