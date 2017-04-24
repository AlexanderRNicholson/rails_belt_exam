class CommentsController < ApplicationController
    
    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        unless @comment.save
            flash[:errors] = @comment.errors.full_messages
        end
        redirect_to :back
    end
    
    def show
        @comments = Comment.where(event: params[:id])
    end
    
    private
    def comment_params
        params.require(:comment).permit(:content, :event_id)
    end
end
