class PostCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.post_comments.new(post_comment_params)
    # comment = Postcomment.new(post_comment_params)
    # comment.user_id = current_user.id
    @comment.book_id = @book.id
    @comment.save
  #   #   redirect_back(fallback_location: root_path)
  #   # else
  #   #   redirect_back(fallback_location: root_path)
  #   # end
  end
  def destroy
    @comment = PostComment.find(params[:id])
    @book = Book.find(params[:book_id])
    # @comment.book_id = @book.id
    @comment.destroy
    # PostComment.find(id: params[:id], book_id: params[:book_id]).destroy
    # redirect_back(fallback_location: root_path)
    # redirect_to request.refererにも
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
