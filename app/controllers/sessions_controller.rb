class SessionsController < ApplicationController
    def login
    end
    def create
        @user = User.new
        if !params[:user][":username"] || params[:user][":password"].empty?
            binding.pry
            redirect_to login_path(@user)
        else
            @user = User.find_by_username(params[:user][":username"])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
    end
    def destroy #logouts user by destorying or clearing out the session id.
        session.delete :user_id
        render 'welcome'
    end
end