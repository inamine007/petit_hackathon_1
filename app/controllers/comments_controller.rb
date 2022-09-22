class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.user_id = current_user.id
    comment.save
    redirect_to request.referer  #同じページをリダイレクト
  end

  def destroy
  end

  private
    def comment_params
        params.require(:comment).permit(:comment, :post_id)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
    end
end
