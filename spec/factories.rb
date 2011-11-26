FactoryGirl.define do
  factory :page do
    template "template"
    sequence(:name) { |n| "page#{n}" }
  end

  factory :section do
    page { Factory(:page) }
    name "section"
    content "content"
  end
end
