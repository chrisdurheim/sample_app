FactoryGirl.define do
	factory :user do
		name					"Chris Durheim"
		email					"christopherdurheim@gmail.com"
		password				"foobar"
		password_confirmation	"foobar"
	end
end