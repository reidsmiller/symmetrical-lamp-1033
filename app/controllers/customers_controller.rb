class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:customer_id])
  end

  def update
    @customer = Customer.find(params[:customer_id])
    if params[:commit] == "Add Item"
      @customer.add_item(params[:item_id])
    end
    redirect_to "/customers/#{params[:customer_id]}"
  end
end