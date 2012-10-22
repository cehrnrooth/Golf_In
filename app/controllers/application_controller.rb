class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  before_filter :keys
  before_filter :sign_in?, :except => [:home, :images, :about]
  
  #unless Rails.application.config.consider_all_requests_local
  #  rescue_from Exception, with: :render_500
  #  rescue_from ActionController::RoutingError, with: :render_404
  #  rescue_from ActionController::UnknownController, with: :render_404
  #  rescue_from ActionController::UnknownAction, with: :render_404
  #  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  #end
  
  def keys
    keys = {:api_key => "f8uxc1elzyek", :secret_key => "heWxLmV4NVa6ybaI"}
  end
  
  def sign_in?
    if session[:atoken].nil?
      store_location
      redirect_to root_path
    end
  end
      
  private
    def render_404(exception)
      @not_found_path = exception.message
      respond_to do |format|
        format.html { render template: 'errors/error_404', layout: 'layouts/application', status: 404 }
        format.all { render nothing: true, status: 404 }
      end
    end

    def render_500(exception)
      @error = exception
      respond_to do |format|
        format.html { render template: 'errors/error_500', layout: 'layouts/application', status: 500 }
        format.all { render nothing: true, status: 500}
      end
    end
  
end
