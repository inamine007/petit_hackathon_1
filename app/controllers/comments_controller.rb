class CommentsController < ApplicationController
  def create
    @post = Post.all
    comment = current_user.comments.new(comment_params)
    comment.user_id = current_user.id
    comment.save
    redirect_to request.referer  #同じページをリダイレクト
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to post_path(@post)
    else
      flash.now[:alert] = 'コメント削除に失敗しました'
      render post_path(@post)
    end
  end

  private
    def comment_params
        params.require(:comment).permit(:comment, :post_id)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
    end
end
