require 'rails_helper'

RSpec.describe "/supermarkets/:supermarket_id", type: :feature do
  describe 'As a visitor when I visit a supermarkets show page' do
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

    it 'I see a unique list of all customers that have shopped at the supermarket' do
      visit "/supermarkets/#{@supermarket.id}"

      expect(page).to have_content(@supermarket.name)
      expect(page).to have_content("All Customers Visited")
      expect(page).to have_content(@customer_1.name)
      expect(page).to have_content(@customer_2.name)
      expect(page).to have_content(@customer_3.name)
      expect(page).to_not have_content(@customer_4.name)
    end
  end
end