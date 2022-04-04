class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # Find the user that is trying to log in
    @user = User.find_by(email: user_params[:email])

    # Check if the user exists and if they provided the correct password
    if @user && @user.password == user_params[:password]
      session[:user_id] = @user.id
      redirect_to articles_path

    elsif @user == nil
      alert = "Email or password is incorrect"
    else
      flash.now[:notice] = "Invalid email or password"
      render :new
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
