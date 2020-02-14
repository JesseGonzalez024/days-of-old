class UsersController < ApplicationController
    #skip_before_action :require_login, only: [:new, :create]
    
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to :action => "show", :id => @user.id
        else 
            render 'new'
        end
    end
    def show
        @user = User.find_by_id(params[:id])
    end
    def edit
        @user = User.find_by_id(params[:id])
    end
    def update
        if current_user
            @user = User.find(params[:id])
            @user.update(username: params[:user][:username])
            redirect_to user_path(@user)
        end
    end
    def destroy
        @user = User.find_by_id(params[:id])
        if @user == session[:user_id]
            @user.destroy
            redirect_to '/'
        end
    end

    private
        def user_params
            params.require(:user).permit(:username, :password)
        end
        def require_login
            return head(:forbidden) unless session.include? :user_id
        end
end
