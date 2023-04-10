class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:customer_id])
  end
end