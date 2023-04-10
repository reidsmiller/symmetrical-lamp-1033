class Supermarket < ApplicationRecord
  has_many :items
  has_many :customers, through: :items

  def distinct_customers
    self.customers.distinct
  end
end