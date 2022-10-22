class PostCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.post_comments.new(post_comment_params)
    # comment = Book.new(post_comment_params)
    # comment.user_id = current_user.id
    comment.book_id = book.id
    if comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
    # redirect_to request.refererにも
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
