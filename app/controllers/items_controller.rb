class ItemsController < ApplicationController
  before_action :check_for_login, except: [:index]


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
