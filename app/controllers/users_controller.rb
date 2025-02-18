class UsersController < ApplicationController
    skip_before_action :authorize, only: :create
    def create
     user=User.create!(user_params)
     session[:user_id]=user.id
     render json: user, status: 201
    end
    def show
         new_user = User.find(session[:user_id])
        render json: new_user, status: 201
    end
    private

    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url, :bio )
    end
end
