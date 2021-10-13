class Api::V1::UsersController < ApplicationController
    before_action :require_login, except: [:create]

    def index 
        @users = User.all
    end

    def home
    end

    def new
        @user = User.new 
    end

    def show
        if params[:user_id]

            @user = User.find_by(id: params[:id])

            if @code_snippet.nil?
                redirect_to new_user_code_snippet_path
            else 
                @code_snippet = @user.code_snippets.find_by(id: params[:id])
                redirect_to user_code_snippets_path(@user)
    end
else
    @code_snippet = CodeSnippet.find_by(id: params[:id])
end
end

def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to @user 
    else
        render 'users/new'
    end
end

def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    session.clear
    flash[:notice] = "User deleted."
    redirect_to users_path 
end

private 
def user_params
    params.require(:user).permit(:name, :email, :password, :code_snippet_id)
end

end 


