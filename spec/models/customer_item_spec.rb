require 'rails_helper'

RSpec.describe CustomerItem, type: :model do
  describe 'relationships' do
    it { should belong_to :customer }
    it { should belong_to :item }
  end

  describe 'instance methods' do
    before(:each) do
      @customer = Customer.create!(name: 'Bob Saget')
      @supermarket = Supermarket.create!(name: 'Wild Oats', location: '123 Baseline Rd')
      @item_1 = @supermarket.items.create!(name: 'Beans', price: 3)
      @item_2 = @supermarket.items.create!(name: 'Turnip', price: 1)
      @item_3 = @supermarket.items.create!(name: 'Milk', price: 5)
      @item_4 = @supermarket.items.create!(name: 'Frozen Dumplings', price: 8)

      CustomerItem.create!(customer_id: @customer.id, item_id: @item_1.id)
      CustomerItem.create!(customer_id: @customer.id, item_id: @item_2.id)
      CustomerItem.create!(customer_id: @customer.id, item_id: @item_3.id)
    end

    it 'can add an item to a customer' do
      params = {customer_id: @customer.id, item_id: @item_4.id}
      CustomerItem.add_item(params)

      expect(@customer.items).to eq([@item_1, @item_2, @item_3, @item_4])
    end
  end
end