class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["name"], password: ENV["password"]
  def show
    @countProducts = Product.pluck(:quantity)

    @countCategories = Product.pluck(:category_id)

  end
end
