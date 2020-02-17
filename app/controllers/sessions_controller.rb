class SessionsController < ApplicationController
    
    def login
    end
    
    def create 
        @user = User.find_by_username(params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            
            redirect_to user_path(@user)
        else 
            flash[:error] = "Could not find an account with matching credentials"
            redirect_to login_path
        end
    end
    
    def destroy
        session.delete :user_id
        redirect_to '/'
    end

    def omniauth
        @user = User.find_or_create_by(uid: auth[:uid]) do |u|
            u.username = email_striper(auth[:info][:email])
            u.password = SecureRandom.hex
        end
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            @user.errors
        end
    end

    private
        def auth 
            request.env['omniauth.auth']
        end
end