class UsersController < ApplicationController
    def new 
        render template: 'users/new'
    end

    def login 
        render template: 'users/login'
    end

    def add
        p params
        user_name = params[:users][:user_name]
        password = params[:users][:password]
        user = User.new()
        user.user_name = user_name
        user.password = password
        user.save
        redirect_to '/posts/show'
    end

    def login2
        user_name = params[:users][:user_name]
        password = params[:users][:password]
        user =  User.find_by(user_name: user_name, password: password) 
        if user then
            session[:user_id] = user.id
            redirect_to '/posts/show'
        else
            render template: '/users/login'
        end
    end

    def logout
        session[:user_id] = nil
        redirect_to '/posts/show'
    end
end
