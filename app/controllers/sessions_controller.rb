class SessionsController < ApplicationController
  def new
  end

  # Create a new session
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  # Log the user out and return to the home page
  def destroy
    sign_out
    redirect_to root_url
  end
end
