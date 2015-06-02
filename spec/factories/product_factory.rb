FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Product Nr. #{n}" }
  end
end