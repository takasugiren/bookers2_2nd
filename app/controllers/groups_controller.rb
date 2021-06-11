class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    @group_lists = Group.all
    @book = Book.new
  end

  def new
    @group = Group.new
  end
  
  def join
    @group = Group.find(params[:group_id])
    @group.users << current_user
    redirect_to  groups_path
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.users << current_user
    if @group.save
      redirect_to groups_url, notice: 'グループを作成しました。'
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @book = Book.new
    @group_user = GroupUser.find_by(user_id: current_user.id, group_id: params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path, notice: 'グループを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.users.delete(current_user)
      redirect_to groups_path

  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :introduction, :profile_image)
  end

end
