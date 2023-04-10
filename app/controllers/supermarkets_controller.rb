class SupermarketsController < ApplicationController
  def show
    @supermarket = Supermarket.find(params[:supermarket_id])
    @customers = @supermarket.distinct_customers
  end
end