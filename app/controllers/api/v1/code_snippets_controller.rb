class Api::V1::CodeSnippetsController < ApplicationController
    before_action :find_code_snippet, only: [:update]
    before_action :require_login 

def index
    @code_snippets = CodeSnippet.all 
    render json: @code_snippets



def create 
    @code_snippet = CodeSnippet.new(code_snippet_params)
    @code_snippet.user = current_user
    if @code_snippet.save
        redirect_to @code_snippet 
    else
        render :new 
    end
end 

def update
    @code_snippet.update(code_snippet_params)
    if @code_snippet.save 
        render json: @code_snippet, status: :accepted 
    else 
        render json: { errors: @code_snippet.errors.full_messages }, status: :unprocessible_entity
    end
end

private 
def code_snippet_params
    params.require(:code_snippet).permit(:title, :snippet)
end 

def find_code_snippet
    @code_snippet = CodeSnippet.find(params[:id])
end



end
