class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:customer_id])
  end

  def update
    if params[:commit] == "Add Item"
      CustomerItem.add_item(params)
    end
    redirect_to "/customers/#{params[:customer_id]}"
  end
end