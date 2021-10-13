class Api::V1::ApplicationController < ApplicationController
    helper_method :current_user



    def logged_in?
        !!current_user
    end

    def require_login
    end

    def current_user
    end

    def u_info
    end
    
end
