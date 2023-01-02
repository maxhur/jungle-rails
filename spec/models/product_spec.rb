require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    before do
      @category = Category.create(name: "Category")
      @product = Product.new(name: "Product", price_cents: 10, quantity: 1, category: @category)
    end

    it 'saves successfully with all fields set' do
      expect(@product.save).to be true
    end
    
    it 'is invalid without a name' do
      @product.name = nil
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
  
    it 'is invalid without a price' do
      @product.price_cents = nil
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is invalid without a quantity' do
      @product.quantity = nil
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is invalid without a category' do
      @product.category = nil
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
