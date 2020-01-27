class CommentsController < ApplicationController
    def add
        require "time"
        now = Time.now
        create_day = now.strftime("%Y/%m/%d %H:%M")
        post_id = params[:id]
        comment = params[:comments][:comment]
        Comment.create(post_id: post_id,user_id: session[:user_id], comment: comment,create_day: create_day)
        redirect_to '/posts/detail/' + post_id.to_s
    end
end
