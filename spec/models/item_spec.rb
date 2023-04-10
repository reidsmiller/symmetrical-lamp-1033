require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items}
    it { should have_many(:customers).through(:customer_items)}
  end

  describe 'instance methods' do
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

    describe '.customer_count' do
      it 'can count number of customers to each item' do
        expect(@item_1.customer_count).to eq(1)
        expect(@item_2.customer_count).to eq(2)
        expect(@item_3.customer_count).to eq(2)
        expect(@item_4.customer_count).to eq(1)
      end
    end
  end
end
