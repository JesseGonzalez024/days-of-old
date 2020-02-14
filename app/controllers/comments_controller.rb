class CommentsController < ApplicationController
    before_action :require_login
    def new
        @comment = Comment.new
    end
    def create
        
    end
    def index
        
    end
    def destroy

    end

end
    