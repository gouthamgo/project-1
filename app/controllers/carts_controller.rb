class CartsController < ApplicationController

  def show
    @cart = @current_cart
    # show the cureent cart
  end

  def destroy
    # empty the cart
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil #reset the cureent cart id to nil
    redirect_to cart_path #send back to the root page
  end
end
