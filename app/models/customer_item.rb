class CustomerItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def self.add_item(params)
    CustomerItem.create(customer_id: params[:customer_id], item_id: params[:item_id])
  end
end