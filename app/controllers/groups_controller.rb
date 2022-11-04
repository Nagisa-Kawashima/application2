class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def index
    @book = Book.new
    @groups = Group.all
    user = current_user
    @following_users = user.following_user
    @follower_users =  user.follower_user
  end

  # def join
  #   @group = Group.find(params[:group_id])
  #   # @group.users << current_user
  #   redirect_to groups_path
  # end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    # @group.users << current_user
    if @group.save
      redirect_to groups_path, notice: "You have created group successfully."
    else
      render 'new'
    end
  end

  def show
    @book = Book.new
    @group = Group.find(params[:id])
    @user = current_user
    @following_users = @user.following_user
    @follower_users = @user.follower_user
    # @group.users = GroupUser(user_id: params[:id])
    # users = User.all
    # @group.users << current_user
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path, notice: "You have updated group successfully."
    else
      render 'edit'
    end

  # def destroy
  #   @group = Group.find(params[:id])
  #   @group.users.delete(current_user)
  #   redirect_to groups_path
  # end
  end



  private

  def group_params
    params.require(:group).permit(:name, :introduction, :image)

  end

  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end

end
