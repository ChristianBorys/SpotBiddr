class SessionsController < ApplicationController
  def new
  end

  def create
    login(params[:email], params[:password])
    if @user
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Email or Password was Invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => 'logged out'
  end

  private

  def set_user
    @user = login(params[:sessions][:email]), params[:sessions][:password]
  end

  def session_params
    params.require(:user).permit(:email, :password)
  end

end
