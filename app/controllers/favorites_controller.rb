class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    # いいねを押した本のもととなる情報
    favorite = current_user.favorites.new(book_id: book.id)
    #favorite = Favorite.new
    #favorite.user_id = current_user.id
    #favorite.book_id = book.id
    # いいねを押した本のIDとログインしたユーザーID
    if favorite.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    if favorite.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
      # root_pathと決まっているわけではないがこのパスにしたほうが安全であるということ
    end

  end
end




