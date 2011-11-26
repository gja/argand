require 'spec_helper'

describe Page do
  context "validations" do
    subject { Page.create(template: "foo", name: "bar") }
    it { should validate_presence_of :template }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should allow_value("name").for(:name) }
    it { should allow_value("na_me").for(:name) }
    it { should allow_value("na-me").for(:name) }
    it { should_not allow_value("na me").for(:name) }
    it { should have_many :sections }
  end
end
