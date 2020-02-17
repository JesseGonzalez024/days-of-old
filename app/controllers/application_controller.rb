class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :email_striper, :belongs_to_user?, :validate
    
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
        
        def validate
            if !logged_in?
                flash[:error] = "Please Log in"
                redirect_to '/'
            end
        end


        def belongs_to_user?(post)
        if @post != nil
            if current_user.id == @post.user_id
                return true
            else 
                false
            end
        end
    end
    
end
