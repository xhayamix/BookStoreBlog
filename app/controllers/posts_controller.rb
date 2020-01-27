class PostsController < ApplicationController
    def show
        companey_id = session[:companey_id]
        @posts = Post.where(company_id: companey_id)
        @username = Array.new()
        if @posts then
            @posts.each do |post|
                #logger.debug(post. user_id)
                user = User.find_by(id: post.user_id)
                @username[post.user_id] = user.user_name
            end
        end
        render template: 'posts/show'
    end

    def detail
        post_id = params[:id]
        @post = Post.find(post_id)
        @username = User.find(@post.user_id).user_name
        @comments = Comment.where(post_id: post_id)
        @comment_username = Array.new()
        @comments.each do |comment|
            #logger.debug(post. user_id)
            user = User.find_by(id: comment.user_id)
            @comment_username[comment.user_id] = user.user_name
        end
        render template: 'posts/detail'
    end

    def new
        render template: 'posts/new'
    end

    def add
        require "date"
        now = Date.today
        p params
        title = params[:posts][:title]
        body = params[:posts][:body]
        image = params[:posts][:image]
        post = Post.new()
        post.image.attach(image)
        post.title = title
        post.body = body
        post.company_id = session[:companey_id]
        post.create_day = now.strftime("%Y/%m/%d")
        post.user_id = session[:user_id]
        post.save
        redirect_to '/posts/show'
    end
end
