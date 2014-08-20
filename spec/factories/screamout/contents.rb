# Read about factories at https://github.com/thoughtbot/factory_girl
module Screamout
  FactoryGirl.define do
    factory :content, class: Content do |c|
      c.url {Faker::Internet.url('google.com')}
      c.title{Faker::Name.title }
      c.image_file_name "abc_1404293248.jpg"
    end
  end
end
