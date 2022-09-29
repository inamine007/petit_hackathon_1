class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user # => @userが、createアクションの初めで、定義されている。
      flash[:success] = "アカウント登録成功しました。#{@user.name}さん、ようこそ！！"
      redirect_to @user
    else
      flash.now[:failed] = "アカウント登録に失敗しました"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @post = current_user.posts.build
    # @posts = current_user.posts.page(params[:page]).per(1)
    @posts = @user.posts.page(params[:page]).per(10)
    # binding.pry
  end
end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation).per(3)
    end

