class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['USER_NAME'], password: ENV['USER_PASSWORD']

  def show
    @products_count = Product.sum(:quantity)
    @category_count = Category.count
  end

  
    

end
