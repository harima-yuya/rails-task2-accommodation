class ApplicationController < ActionController::Base
    before_action :set_search
    def set_search
      @search = Inn.ransack(params[:q])
      @inns = @search.result
    end
  
    before_action :configure_permitted_parameters, if: :devise_controller?
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:name]) 
    end
end
