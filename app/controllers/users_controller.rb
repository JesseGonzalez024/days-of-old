class UsersController < ApplicationController
    #before_action :require_login
    #skip_before_action :require_login, only: [index]
    
    def new #prompts new user signup
        @user = User.new
    end
    def create #creates new user
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
        
    end
    def update 
    
    end
    def destroy
        
    end

    private
        def user_params
            params.require(:user).permit(:username, :password)
        end

        # def require_login
        #     return head(:forbidden) unless session.include? :user_id
        # end
end
