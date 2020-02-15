class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :email_striper
    
    def welcome
    end
    
    def logged_in?
        !!current_user
    end
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def email_striper(email)
        username = email.split(/@gmail.com/)
        username[0]
    end

    #Create a helper method that verifies if the items belogn to the user
        #If items belong to use then CRUD functions become available.
        #Else User is asked to sign in.

end
