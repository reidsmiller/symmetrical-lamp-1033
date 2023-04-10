require 'rails_helper'

RSpec.describe '/customers/:customer_id', type: :feature do
  describe 'As a visitor, when I visit a customer show page' do
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

    it 'I see the customers name and a list of its items including price and name of supermarket' do
      visit "/customers/#{@customer.id}"

      save_and_open_page
      expect(page).to have_content("Customer: #{@customer.name}")
      within("li#item_#{@item_1.id}") do
        expect(page).to have_content(@item_1.name)
        expect(page).to have_content("Price: #{@item_1.price}")
        expect(page).to have_content("Supermarket: #{@supermarket.name}")
      end

      within("li#item_#{@item_2.id}") do
        expect(page).to have_content(@item_2.name)
        expect(page).to have_content("Price: #{@item_2.price}")
        expect(page).to have_content("Supermarket: #{@supermarket.name}")
      end
      
      within("li#item_#{@item_3.id}") do
        expect(page).to have_content(@item_3.name)
        expect(page).to have_content("Price: #{@item_3.price}")
        expect(page).to have_content("Supermarket: #{@supermarket.name}")
      end
    end
  end
end