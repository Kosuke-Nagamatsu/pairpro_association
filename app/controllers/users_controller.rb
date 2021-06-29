class UsersController < ApplicationController
    skip_before_action :login_required, only: [:new,:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.favorites
    @login_user_blogs = current_user.blogs
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password)
  end

end
