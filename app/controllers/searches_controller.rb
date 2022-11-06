class SearchesController < ApplicationController
  before_action :authenticate_user!


  def search
    @range = params[:range]
    # @word = params[:word]


    if @range == "User"
      @users = User.search_for(params[:search], params[:word])
    elsif @range == "Book"
      @books = Book.search_for(params[:search], params[:word])
    elsif @range == "Tag"
      @books = Tag.search_books_for(params[:search], params[:word])
    end
  end
end



# 検索モデル→params[:range]
# 　検索方法→params[:search]
# 　検索ワード→params[:word]
# ooksメソッドを使い、検索内容を取得し、変数に代入します。