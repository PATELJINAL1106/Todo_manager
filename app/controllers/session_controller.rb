class SessionController < ApplicationController
    skip_before_action:ensure_user_logged_in, :only =>[:new, :create]

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:current_user_id] = user.id 
            recirect_to "/"
        else
            flash[:error] = "Your login attempt was invalid, please retry"
            redirect_to new_sessions_path
        end
    end

    def new
    end

    def destroy
         session[:current_user_id] = nil
         @current_user = nil
         redirect_to "/"
    end
end
