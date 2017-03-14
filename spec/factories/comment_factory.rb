FactoryGirl.define do 
	factory :comment do 
		user
		product
		body "Nice product"
		rating "3"
	end
end