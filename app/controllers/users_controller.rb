class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
   user = User.find(params[:id])
   user.update( user_params )
   redirect_to user_path(user)
  end

  def show
    @user = User.find params[:id]
    # @items = Item.all.where(user_id: @current_user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name,:email, :password, :password_confirmation)
  end
end
