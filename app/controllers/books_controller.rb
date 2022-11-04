class BooksController < ApplicationController
  before_action :correct_book,only: [:edit, :update, :destroy]

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @hoge = Book.new
    @post_comment = PostComment.new
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def index
    to  = Time.current.at_end_of_day
    from  = (to - 6.day).at_beginning_of_day
    @books = Book.all.sort {|a,b|
      b.favorites.where(created_at: from...to).size <=>
      a.favorites.where(created_at: from...to).size
    }


    # @books = Book.all
    # @books = Book.find(Favorite.group(:book_id).order('count(book_id) desc').pluck(:book_id))
      # to = Time.current.at_end_of_day
      # from = (to - 6.day).at_beginning_of_day
      # @books = Book.includes(:favorited_users).
      #   sort_by {|x|
      #     x.favorited_users.includes(:favorites).where(created_at: from...to).size
      #   }.reverse
    # to  = Time.current.at_end_of_day
    # from  = (to - 6.day).at_beginning_of_day
    # @books = Book.includes(:favorited_users).
    #   sort {|a,b|
    #     b.favorited_users.includes(:favorites).where(created_at: from...to).size <=>
    #     a.favorited_users.includes(:favorites).where(created_at: from...to).size
    #   }
    # @all_lanks = Book.find(Favorite.group(:book_id).order('count(book_id) desc').pluck(:book_id))
    @book = Book.new
    @post_comments = PostComment.new
    @user = current_user
    @following_users = @user.following_user
    @follower_users = @user.follower_user
    # @favorites = Favorites.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      # @book = Book.new
      render 'index'
    end
  end

  def edit
    # @book = Book.find(params[:id])
  end

  def update
    # @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    # @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image, :rate)
  end
  def correct_book
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
  end
end
