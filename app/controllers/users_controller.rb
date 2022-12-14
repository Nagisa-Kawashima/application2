class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @following_users = @user.following_user
    @follower_users = @user.follower_user
    @today_book = @books.created_today
    @yesterday_book = @books.created_yesterday
    @this_week_book = @books.created_this_week
    @last_week_book = @books.created_last_week
    
  
  end
  
  def search_form
    @user = User.find(params[:user_id])
    @books = @user.books.where(created_at: params[:created_at].to_date.all_day)
    render :search_form
  end
  
  
  
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def edit
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to user_path(current_user)
    end

    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.id = current_user.id
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      # @book = Book.new
      render :edit
    end
  end
  def follows
    user = User.find(params[:id])
    @users = user.following_user
    @following_users = user.following_user
    @follower_users = user.follower_user
  end
  def followers
    user = User.find(params[:id])
    @users = user.follower_user
    @following_users = user.following_user
    @follower_users = user.follower_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end


end
