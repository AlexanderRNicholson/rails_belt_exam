class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def index
  end
  
  def new
  end
  
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/events"
    else
      flash[:errors] = ["Invalid"]
      redirect_to '/sessions/new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to '/sessions/new'
  end

end