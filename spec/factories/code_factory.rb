FactoryGirl.define do
  factory :code do
    sequence(:value) { |n| "code_#{n}" }
    product
  end
end