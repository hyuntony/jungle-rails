require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do
      @category = Category.new(name: "test")
      @product = @category.products.new
      @product.name = "Anything"
      @product.price = 1000
      @product.quantity = 23 
      @product.save
      
      expect(@product).to be_valid
    end
    it "is not valid without a name" do
      @category = Category.new(name: "test")
      @product = @category.products.new
      @product.name = nil
      @product.price = 1000
      @product.quantity = 23 
      @product.save
      
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "is not valid without a price" do
      @category = Category.new(name: "test")
      @product = @category.products.new
      @product.name = "Anything"
      @product.quantity = 23 
      @product.save
      
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "is not valid without a quantity" do
      @category = Category.new(name: "test")
      @product = @category.products.new
      @product.name = "Anything"
      @product.price = 1000
      @product.quantity = nil
      @product.save
      
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "is not valid without a category" do
      @category = Category.new(name: "test")
      @product = Product.new
      @product.name = "Anything"
      @product.price = 1000
      @product.quantity = 23 
      @product.save
      
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
