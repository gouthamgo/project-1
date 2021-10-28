class PagesController < ApplicationController
  def home
    @items = Item.all
    # item method tells Rails to
    # search the items table and store each row it finds in the @items instance object.
  end
end
