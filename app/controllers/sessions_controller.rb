class SessionsController < ApplicationController
  def new

  end

  def create
    u = User.find_by(email: params[:email])

    if u && u.authenticate(params[:password])

      session[:user_id] = u.id

      flash[:notice] = 'Sucessfully logged in!'
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = 'Try again!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'youre logged out!'
    redirect_to root_url, notice: "Logged out!"
  end

end
