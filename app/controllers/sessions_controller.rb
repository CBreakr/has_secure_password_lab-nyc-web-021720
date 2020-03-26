class SessionsController < ApplicationController

    def new
    end

    def create
        if !session.has_key?(:login_attempts) then
            session[:login_attempts] = 1
        else
            session[:login_attempts] += 1
        end

        @user = User.find_by(name: session_params[:name])
        if @user && @user.authenticate(session_params[:password]) then
            session[:user_id] = @user.id
            session[:login_attempts] = 0
            redirect_to users_home_path
        # elsif session[:login_attempts] >= 3
        #     flash[:notice] = "Login attempt limit reached, do you want to create a different user?"
        #     redirect_to "/users/new"
        # else
        #     flash[:notice] = "Invalid login attempt, attempt #{session[:login_attempts]} of 3"
        #     render :new
        else
            redirect_to new_user_path
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def session_params
        params.require(:user).permit(:name, :password)
    end
end