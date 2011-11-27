FactoryGirl.define do
  factory :page do
    template "sample_template"
    sequence(:name) { |n| "page#{n}" }
  end

  factory :section do
    page { Factory(:page) }
    name "section"
    content "content"
  end
end
