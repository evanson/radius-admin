class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    if signed_in?
      redirect_to radiuslogins_path
    end
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # Sign in user
      sign_in user
      redirect_to radiuslogins_path
    else
      # Rerender signin form
      flash[:error] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
