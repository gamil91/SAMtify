class SessionsController < ApplicationController

    def new

    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:success] = "Welcome, #{@user.username}"
            redirect_to @user
        else
            flash[:danger] = "Invalid Username or Password"
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to login_path
    end
    
end
