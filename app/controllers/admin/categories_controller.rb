class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['USER_NAME'], password: ENV['USER_PASSWORD']

  def index
    @categories = Category.order(id: :desc).all
  end

  def show
    @category = Category.name
    @products = @category.count
  end

  def new
    @categories = Category.new
  end

  def create
    @categories = Category.new(category_params)

    if @categories.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
