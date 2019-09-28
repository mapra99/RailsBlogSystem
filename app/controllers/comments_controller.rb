class CommentsController < ApplicationController
    before_action :require_login
    
    include CommentsHelper
    def create
        @comment = Comment.new(comment_params)
        @comment.article_id = params[:article_id]
        @comment.save

        flash.notice = "Your comment has been posted!"

        redirect_to article_path(@comment.article)
    end
end
