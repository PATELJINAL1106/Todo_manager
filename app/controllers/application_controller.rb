class ApplicationController < ActionController::Base 
    before_action :ensure_user_logged_in

    def ensure_user_logged_in
        unless current_user
            #halt the request cycle
            redirect_to "/"
        end
    end

    def current_user
        #mamoization
        return @current_user if @current_user

        current_user_id = session[:current_user_id]
        if current_user_id
            @current_user = User.find(current_user_id)
            @current_user
        else
           nil
        end 
    end
end
