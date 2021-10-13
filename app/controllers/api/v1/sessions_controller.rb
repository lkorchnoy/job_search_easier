class Api::V1::SessionsController < ApplicationController
    before_action :u_info, only: [:github_create]
    
def new
end

def github_create
    redirect_to code_snippets_path 
end

def create
    @user = User.find_or_create_by(email: params[:sessions][:email])

    if @user && @user.authenticate(params[:sessions][:password])
        session[:user_id] = @user.id 
        redirect_to code_snippets_path 
    else
        render :new 
    end
end

def destroy
    session.delete :user_id 
    redirect_to login_path 
end

private
def auth 
    request.env['omniauth.auth']
end


end
