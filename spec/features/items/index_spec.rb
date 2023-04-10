require 'rails_helper'

RSpec.describe '/items', type: :feature do
  describe 'As a visitor, when I visit the items index page,' do
    before(:each) do
      @customer_1 = Customer.create!(name: 'Bob Saget')
      @customer_2 = Customer.create!(name: 'Alison Brie')
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
    end

    it 'I see a list of all items, their names, prices, supermarkets, and the count of customers who bought it' do
      visit '/items'

      expect(page).to have_content("Items Index")
      within("li#item_index_#{@item_1.id}") do
        expect(page).to have_content(@item_1.name)
        expect(page).to have_content("Price: #{@item_1.price}")
        expect(page).to have_content("Supermarket: #{@supermarket.name}")
        expect(page).to have_content("Number of Customers Bought Item: 1")
      end

      within("li#item_index_#{@item_2.id}") do
        expect(page).to have_content(@item_2.name)
        expect(page).to have_content("Price: #{@item_2.price}")
        expect(page).to have_content("Supermarket: #{@supermarket.name}")
        expect(page).to have_content("Number of Customers Bought Item: 2")
      end

      within("li#item_index_#{@item_3.id}") do
        expect(page).to have_content(@item_3.name)
        expect(page).to have_content("Price: #{@item_3.price}")
        expect(page).to have_content("Supermarket: #{@supermarket.name}")
        expect(page).to have_content("Number of Customers Bought Item: 2")
      end

      within("li#item_index_#{@item_4.id}") do
        expect(page).to have_content(@item_4.name)
        expect(page).to have_content("Price: #{@item_4.price}")
        expect(page).to have_content("Supermarket: #{@supermarket.name}")
        expect(page).to have_content("Number of Customers Bought Item: 1")
      end
    end
  end
end