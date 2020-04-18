class UsersController < ApplicationController
  def show
    @user = User.find_by(email: session[:login_token])
  end

  def edit
    find_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_clean) # 請查看 strong parameters 概念
    if @user.save
      session[:login_token] = @user.email
      redirect_to root_path, notice: "已成功註冊！"
    else
      render :new
    end
  end

  def logout
    session[:login_token] = nil
    redirect_to root_path, notice: "已成功登出！"
  end

  def login
    @user = User.new
  end

  def login_action
    user = User.find_by(email: params[:user][:email], password: params[:user][:password])
    if user
      session[:login_token] = params[:user][:email]
      redirect_to root_path, notice: "歡迎 #{params[:user][:email]} 您以成功登入！"
    else
      render :login
      flash[:notice] = "帳號或密碼錯誤！"
    end
  end

  def destroy
    @user = User.find_by(email: session[:login_token])
    @user.destroy
    redirect_to root_path, notice: "已註銷帳號"
  end
  
  private
  def find_user
    @user = User.find(params[:id])
  end
  def user_clean
    params.require(:user).permit(:email, :password, :tel, :password_confirmation)
  end
end
