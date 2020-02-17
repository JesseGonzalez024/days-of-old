class UsersController < ApplicationController
    
    def new
        validate
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
        validate
        @user = User.find_by_id(params[:id])
    end
    def edit
        validate
        @user = User.find_by_id(params[:id])
    end
    def update
        validate
            @user = User.find(params[:id])
            if @user.valid?
                @user.update(username: params[:user][:username])
                redirect_to user_path(@user)
            else
                render :edit
            end
    end
    def destroy
        validate
        @user = User.find_by_id(params[:id])
        @user.destroy
        redirect_to '/'
        flash[:error] = "Your account has been deleted :("
    end

    private
        
        def user_params
            params.require(:user).permit(:username, :password)
        end
end
