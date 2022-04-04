class ApplicationController < ActionController::Base
    # def hello
    #     render html: "hello world!"
    # end
    helper_method :current_user
    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        end
    end
end
