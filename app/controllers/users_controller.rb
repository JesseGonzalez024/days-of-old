class UsersController < ApplicationController
    
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
            render :new
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
        if logged_in?
            @user.destroy
            redirect_to '/'
            flash[:error] = "Your account has been deleted :("
        end
    end

    private
        
        def user_params
            params.require(:user).permit(:username, :password)
        end
end
