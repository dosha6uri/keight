class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).order('created_at desc')
    @joins = Joining.where(user_id: @user.id)
    comm = []
    @joins.each {|join|
      @communities = comm.push(Community.find_by(id: join.comm_id))
    }

  end

  def comms
    @user = User.find_by(username: params[:user_name])
    @community = Community.find_by(comm_name: params[:comm_name])
    @posts = Post.where(comm_id: @community.id).where(submitter: @user.id).order('created_at desc')
    @joins = Joining.where(user_id: @user.id)
    comm = []
    @joins.each {|join|
      @communities = comm.push(Community.find_by(id: join.comm_id))
    }
  end

  private

  
end
