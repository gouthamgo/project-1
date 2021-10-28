class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    # make a blank User object to give to 'form_for' in the template
  end

  def create
    @user = User.create user_params
    if @user.persisted?
      #  log the user in automatically so they don't
      # immediately have to enter the same details again
      # into the login form
      session[:user_id] = @user.id
      redirect_to root_path
    else
      # we won't do this:
      # redirect_to login_path

      # instead, we render the template for the 'new' action
      # i.e., the blank form, from this 'create' action
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
