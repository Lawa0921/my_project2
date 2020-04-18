class UsersController < ApplicationController
  def show
    find_user
  end

  def edit
    find_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_clean) # 這邊這樣做的原因是因為必須要讓@user 拿到 model的方法，有才辦法做 .save
    if @user.save
      session[:abcdefg] = @user.email
      redirect_to root_path, notice: "已成功註冊！"
    else
      render :new
    end
  end

  def logout
    session[:abcdefg] = nil
    redirect_to root_path, notice: "已成功登出！"
  end
  
  private
  def find_user
    @user = User.find(params[:id])
  end
  def user_clean
    params.require(:user).permit(:email, :password, :tel, :password_confirmation)
  end
end
