class ItemsController < ApplicationController
  before_action :check_for_login, except: [:index]
  # authorise action before going to buy something


  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end



  def create
    @item = item.create(item_params)
    redirect_to items_path
  end

  def edit
    @item = Item.find params[:id]
  end


  # The show method's @item = Item.find(params[:id]) line tells Rails to find only
  # the item that has the id defined in params[:id].

  # The params object is a container that enables you to pass values between method calls.

  def show
    @item = Item.find params[:id]
    @user = @item.user
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :description)
  end
end
