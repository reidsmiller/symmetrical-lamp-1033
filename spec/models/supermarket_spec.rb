require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :items }
    it { should have_many(:customers).through(:items)}
  end

  describe 'instance methods' do
    before(:each) do
      @customer_1 = Customer.create!(name: 'Bob Saget')
      @customer_2 = Customer.create!(name: 'Alison Brie')
      @customer_3 = Customer.create!(name: 'Frank Herbert')
      @customer_4 = Customer.create!(name: 'Spongebob')
      @supermarket = Supermarket.create!(name: 'Wild Oats', location: '123 Baseline Rd')
      @item_1 = @supermarket.items.create!(name: 'Beans', price: 3)
      @item_2 = @supermarket.items.create!(name: 'Turnip', price: 1)
      @item_3 = @supermarket.items.create!(name: 'Milk', price: 5)
      @item_4 = @supermarket.items.create!(name: 'Frozen Dumplings', price: 8)

      CustomerItem.create!(customer_id: @customer_1.id, item_id: @item_1.id)
      CustomerItem.create!(customer_id: @customer_1.id, item_id: @item_2.id)
      CustomerItem.create!(customer_id: @customer_1.id, item_id: @item_3.id)
      CustomerItem.create!(customer_id: @customer_2.id, item_id: @item_2.id)
      CustomerItem.create!(customer_id: @customer_2.id, item_id: @item_3.id)
      CustomerItem.create!(customer_id: @customer_2.id, item_id: @item_4.id)
      CustomerItem.create!(customer_id: @customer_3.id, item_id: @item_1.id)
    end

    describe '.distinct_customers' do
      it 'can filter duplicates to distinct customers' do
        expect(@supermarket.distinct_customers).to eq([@customer_1, @customer_2, @customer_3])
      end
    end
  end
end