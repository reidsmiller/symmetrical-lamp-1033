class CustomerItemsController < ApplicationController
  def create
    CustomerItem.create(app_params)
    redirect_to "/customers/#{params[:customer_id]}"
  end

  private
  def app_params
    params.permit(:customer_id, :item_id)
  end
end