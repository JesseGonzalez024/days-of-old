class PostsController < ApplicationController
    before_action :require_login, only: [:index, :new, :create, :destroy]
    
    
    def index
        @posts = Post.all
    end
    
    def new 
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = session[:user_id]
        
        if @post.valid?
            @post.save
            redirect_to :action => "index"
        else
            render :new
        end
    end
    
    def show 
        @post = Post.find_by_id(params[:id])
    end
    
    def destroy
        @post = Post.find_by_id(params[:id])
        if current_user
            @post.destroy
            redirect_to posts_path
        end 
    end
    
    private
        def post_params
            params.require(:post).permit(:title, :year, :era, :content)
        end
        def require_login
            return head(:forbidden) unless session.include? :user_id
        end
end