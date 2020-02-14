class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    
    def welcome
    end
    
    def logged_in?
        !!current_user
    end
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    # def belongs_to_user?(trip)
    #     if @trip != nil
    #       if current_user.id != @trip.user_id
    #         binding.pry
    #         erb :welcome
    #       end
    #     end
    #   end
  
    #   def validate
    #     if !logged_in? || @trip == nil || current_user.id != @trip.user_id
    #       redirect to '/'
    #     end
    #   end
end
