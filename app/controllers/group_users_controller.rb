class GroupUsersController < ApplicationController
  def create
    @group_user = GroupUser.new(user_id: current_user.id, group_id: params[:group_id])
    if @group_user.save
      redirect_to groups_path(@group_user.group.id)
    end
  end
end
