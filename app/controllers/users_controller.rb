class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:index]

  def index
    @users = User.all
  end

  def toggle_admin
    @user = User.find(params[:id])
    @user.admin = !@user.admin
    @user.save
    redirect_to users_index_path
  end

  private
  def authenticate_admin!
    unless current_user.is_admin?
      redirect_to root_path
    end
  end
end
