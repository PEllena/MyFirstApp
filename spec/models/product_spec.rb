require 'rails_helper'

describe Product do

	context "when the product has comments" do
		
		before do
		  @product = FactoryGirl.create(:product)
		  @user = FactoryGirl.build(:user)
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