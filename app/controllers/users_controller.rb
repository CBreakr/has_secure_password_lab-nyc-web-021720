class UsersController < ApplicationController

    def home
        @user = current_user
        if !@user then
            redirect_to login_path
        end
    end

    def create
        @user = User.create(user_params)
        if @user.save then
            session[:user_id] = @user.id
            redirect_to users_home_path
        # elsif @user.valid?
        #     redirect_to new_user_path
        # else
        #     redirect_to users_duplicate_path
        else
            redirect_to new_user_path
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end