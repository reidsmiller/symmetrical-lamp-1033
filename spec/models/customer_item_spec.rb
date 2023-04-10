require 'rails_helper'

RSpec.describe CustomerItem, type: :model do
  describe 'relationships' do
    it { should belong_to :customer }
    it { should belong_to :item }
  end

  describe 'validations' do
    it { should validate_presence_of(:customer_id) }
    it { should validate_presence_of(:item_id) }
    it { should validate_numericality_of(:item_id)}
  end
end