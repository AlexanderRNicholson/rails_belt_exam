class UsersController < ApplicationController
    
    def new
    end
    
    def show
    end
    
    def edit
      @user = User.find(params[:id])
    end
    
    def create
        @user = User.new(user_params)
        puts @user
        if @user.save
          session[:user_id] = @user.id
            redirect_to "/events"
        else
          flash[:errors] = @user.errors.full_messages
          redirect_to "/sessions/new"
        end
    end
    
    def update
      @user = User.find(params[:id])
    if @user.update user_params
      redirect_to "/events"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}/edit"
    end
    end
    
    def destroy
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
    end
end
