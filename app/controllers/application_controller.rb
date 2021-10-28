class ApplicationController < ActionController::Base
  # This will cause the fetch_user method to run
  # before every action of every controller
  # (because they all inherit from this one)
  before_action :fetch_user
  before_action :current_cart

private
  def fetch_user
    # Check if the user_id in the session hash is the ID
    # of a real user in our users table: if it is, get
    # object for that user and save it into @current_user
    # which every controller can use; if it's not a real ID,
    # consider it invalid and delete the session (this will
    # prevent weird errors when re-seeding our DB)
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    # If we did get nil from the above user lookup query,
    # then delete the session (because the user_id is invalid)
    session[:user_id] = nil unless @current_user.present? # Log out non-existent users.
  end

  def check_for_login
    # If the current request is coming from a user who is NOT
    # logged in, redirect them to the login page
    # Any controller actions that should be available only to
    # logged-in users can then run this method before they
    # do their work, i.e. we can lock down those routes
    unless @current_user.present?
      flash[:error] = "You must be logged in"
      redirect_to login_path
    end
  end

  def check_for_admin # admin action -optional
    redirect_to login_path unless (@current_user.present? && @current_user.admin?)
  end

# helper
 def current_cart
    if session[:cart_id] #If a session[:cart_id] already exists then find the Cart with that id, if there is no cart with that id then set the session id to nil.
      cart = Cart.find_by :id => session[:cart_id]
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
    end
      if session[:cart_id] == nil
        # If there is no session[:cart_id] associated with this user then create a new cart and store it in the users session id
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end


end
