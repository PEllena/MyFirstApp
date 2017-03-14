FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com" }

	factory :user do
		first_name "Alex"
		last_name "Bliner"
		email
		password "7654321"
		admin false
	end

	factory :admin, class: User do
		irst_name "Admin"
	  last_name "User"
	  email
	  password "1234567"
	  admin true
	end
end