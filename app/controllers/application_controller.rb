class ApplicationController < ActionController::API
  include ActionController::Cookies
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
before_action :authorize

private
 
def authorize
 @currentuser=User.find_by(id: session[:user_id])
 render json: {errors: ["Not authorized"] }, status: :unauthorized unless @currentuser
end
def render_unprocessable_entity(exep)
   render json: { errors: exep.record.errors.full_messages }, status: :unprocessable_entity
end
end
