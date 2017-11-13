require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'name should exist for new records' do
      @category = Category.new name: 'Bath'
      expect(@category.name).to be_present
    end

    it 'product should have all properties when created' do
      @product = Product.new
      expect(@product).not_to be_valid
    end

    it 'product should have name property' do
      @product = Product.new name:'Towel'
      expect(@product.name).to be_present
    end

    it 'product should have price property' do
      @product = Product.new price: 39
      expect(@product.price).to be_present
    end


    it 'product should have quantity property' do
      @product = Product.new quantity: 2
      expect(@product.quantity).to be_present
    end

    it 'product should have category property' do
      @category = Category.create name: 'Bath'
      @product = Product.new category: @category
      expect(@product.category).to be_present
    end

    it 'product should have all required properties' do
      @category = Category.create name: 'Bath'
      @product = Product.create name:'Towel', category: @category, quantity: 2, price: 40
      expect(@product).to be_valid
    end

    it 'product not should have all required properties' do
      @category = Category.create name: 'Bath'
      @product = Product.create name:'Towel', category: @category
      expect(@product).not_to be_valid
    end
  end
end
