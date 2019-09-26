class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email_parms)
    if user && user.authenticate(password_params)
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def email_parms
    params.require(:session).permit(:email)
  end
  
  def password_parms
    params.require(:session).permit(:password)
  end


end

