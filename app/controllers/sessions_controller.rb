class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(session_params[:email], session_params[:password])

    if user
      log_in_user!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["Invalid Credentials. Nice try."]
      render :new
    end
  end

  def destroy
    user = current_user
    log_out!(current_user)
    render :new
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
