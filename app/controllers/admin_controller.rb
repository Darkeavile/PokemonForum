class AdminController < ApplicationController
  def index
  	@categories = Category.all.order("title ASC")
  end
end
