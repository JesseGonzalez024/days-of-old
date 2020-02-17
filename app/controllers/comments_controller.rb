class CommentsController < ApplicationController
    before_action :require_login
    
    def new
        validate
        @comment = Comment.new
        @post = Post.find_by_id(params[:post_id])
    end
    def create
        validate
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
    