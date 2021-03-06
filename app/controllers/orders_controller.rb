class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    # The above method will be called when you will display a page to the user to take user input.
  end

  def create
    @order = Order.new order_params
    @current_cart.line_items.each do |item|
      @order.line_items << item #append each item as line item in the order
      item.cart_id = nil # stops the line items being deleted after the cart is destroyed
    end
    @order.save
    Cart.destroy session[:cart_id]
    session[:cart_id] = nil #destroy the cart and set the session back to nil
    flash[:notice] = 'Purchase successful'
    redirect_to  root_path
  end


  def show
    @order = Order.find params[:id]
  end

  private
  def order_params
    params.require(:order).permit(:name, :email, :address,  :location)
  end
end
