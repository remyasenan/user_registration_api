class GroupsController < ApplicationController

  # User can perform the following functions only if User.token_validity_end_by > Time.now
  def create
    @group = Group.new(group_params)
    if @group.save
      format.json { render json: root_path, status: :created, location: @group  }
    end
  end

  def assign_users_to_group(*userids,groupid)
    @userids = userids
    @userids.each do |userid|
      user = User.find(userid)
      user.group_id = groupid
      user.save
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
