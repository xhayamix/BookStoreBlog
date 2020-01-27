class CompaneysController < ApplicationController
    def show
        @companeys = Company.all
        render template: 'companeys/show'
    end

    def detail
        session[:companey_id] = params[:id]
        redirect_to '/posts/show'
    end

    def add
        p params
        company_name = params[:companies][:company_name]
        company = Company.new()
        company.company_name = company_name
        company.save
        redirect_to '/posts/show'
    end

    def new 
        render template: 'companeys/new'
    end
end
