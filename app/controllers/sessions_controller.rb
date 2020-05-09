
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])

      log_in(user)
      remember(user)

      redirect_to root_path

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out(current_user)
    flash[:danger] = 'Vous vous êtes déconnectés.'
    redirect_to root_path
  end
end