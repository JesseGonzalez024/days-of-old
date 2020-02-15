class CommentsController < ApplicationController
    before_action :require_login
    
    def new
        @comment = Comment.new
        @post = Post.find_by_id(params[:post_id])
    end
    def create
        @comment = Comment.new(text: params[:comment][:text])
        @comment.post_id = params[:post_id]
        
        if @comment.save
            redirect_to post_path(@comment.post_id)
        end
    end

    def destroy

    end
    
    private
        def require_login
            return head(:forbidden) unless session.include? :user_id
        end

end
    