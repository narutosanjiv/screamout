# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :content do |c|
    c.url {Faker::Internet.url}
	end
end