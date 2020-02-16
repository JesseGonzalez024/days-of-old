class CommentsController < ApplicationController
    before_action :require_login
    #Comments can be posted despite if the post belongs to the user or not.
    #Post has_many comments
    #User has_many comments through posts. 
    
    def new
        @comment = Comment.new
        @post = Post.find_by_id(params[:post_id])
    end
    def create
        @comment = Comment.new(text: params[:comment][:text], user_id: current_user.id, post_id: params[:post_id])
        
        if @comment.save
            redirect_to post_path(@comment.post_id)
        end
    end
    
    private
        def require_login
            return head(:forbidden) unless session.include? :user_id
        end

end
    