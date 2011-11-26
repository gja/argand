FactoryGirl.define do
  factory :page do
    template "template"
    sequence(:name) { |n| "page#{n}" }
  end
end
