class SessionsController < ApplicationController
  def new
  end

  def create
    byebug
    user = User.find_or_create_by(email_address: params[:session][:email_address])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash.now[:error] = "Invalid Login. Try Again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
