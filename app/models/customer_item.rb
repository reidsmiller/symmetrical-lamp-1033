class CustomerItem < ApplicationRecord
  validates :customer_id, presence: true
  validates :item_id, presence: true, numericality: true

  belongs_to :customer
  belongs_to :item
end