class PostsController < ApplicationController
  # before_action :correct_user, only: :destroy
  def create
    @user = current_user
    @post = @user.posts.build(post_params)
    if @post.save
      flash[:sucess] = "投稿しました！"
      redirect_to current_user
    else
      render 'users/show'
    end
  end

  def show
    # @user = User.find(params[:id])
    # @post = @user.posts
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    byebug
    @post.destroy
    flash[:sucess] = "投稿を削除しました！！"
    redirect_to request.referer || root_url
  end

  def index
    @posts = Post.all
    @posts = @posts.page(params[:page]).per(10)
  end

  private
    def post_params
      params.require(:post).permit( :title, :image )
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to user_url if @post.nil?
    end

end

