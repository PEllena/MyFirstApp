require 'rails_helper'

describe Product do
	context "when the product has comments" do
		before do
		  @product = Product.create!(name: "mina face", description: "oil canvas", image_url: "image20", colour: "multi", price: "39")
		  @user = User.create!(email: "smitha@mail.com", password: "123409" )
		  @product.comments.create!(rating: 1, user: @user, body: "ok")
		  @product.comments.create!(rating: 3, user: @user, body: "beautiful")
		  @product.comments.create!(rating: 5, user: @user, body: "amazing!")
		end

		it "returns the average rating of all comments" do
			 expect(@product.average_rating).to eq (3)
		end

		it "is not valid" do
			expect(Product.new(description: "Nice picture")).not_to be_valid
		end

	end
end