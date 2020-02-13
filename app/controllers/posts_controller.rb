class PostsController < ApplicationController
    #before_action :require_login
    
    def index
        @posts = Post.all
    end
    def new 
        @post = Post.new
    end
    def create
        
    end
    def show 

    end
    def edit

    end
    def update

    end
    def destroy
        
    end
    
    private 
        # def require_login
        #     return head(:forbidden) unless session.include? :user_id
        # end
end