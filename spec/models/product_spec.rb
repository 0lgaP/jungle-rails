require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations'do

    #a product with all four fields set will indeed save successfully
    it "is able to save when all 4 properties are included" do
      @category = Category.new
      @product = Product.new({
        name: "shiny_product",
        price: 350,
        quantity: 1,
        category: @category
      })
      expect(@product).to be_valid
    end

    #noname
    #can also write expect(@product.errors.messages).to eq ({:name=>["can't be blank"]})
    it "is not able to save without name" do
      @category = Category.new
      @product = Product.new({
        price: 420,
        quantity: 69,
        category: @category
      })
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eql (["Name can't be blank"])
    end

    #no price
    # can also be expect(@product.errors.messages).to eq({:price=>["is not a number", "can't be blank"], :price_cents=>["is not a number"]})
    it "is not able to save without price" do
      @category = Category.new
      @product = Product.new({
        name: "cool thing",
        quantity: 7,
        category: @category
      })
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eql (["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end

    #no quantity
    it "is not able to save without quanity" do
      @category = Category.new
      @product = Product.new({
        name: "amazing thing",
        price: 9.99,
        category: @category
      })
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eql (["Quantity can't be blank"])
    end

    #no category
    it "is not able to save without category" do
      @product = Product.new({
        name: "amazing thing",
        price: 9.99,
        quantity: 5
      })
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eql (["Category can't be blank"])
    end

  end
end
