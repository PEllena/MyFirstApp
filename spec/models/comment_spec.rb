require 'rails_helper'

describe Comment do
  
  context "comment body presence" do
    before do
      @user = FactoryGirl.build(:user)
      @product = FactoryGirl.build(:product)
    end

    it "will not save" do
      expect(FactoryGirl.build(:comment, body: "")).not_to be_valid
    end
    it "will save" do
      expect(FactoryGirl.build(:comment)).to be_valid
    end
  end
end