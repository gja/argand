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

  context "sections" do
    let(:page) { Factory(:page) }

    it "creates sections if they do not exist" do
      page.update_sections("section1" => { "value" => "blah" } )
      page.should have(1).sections
      page.sections[0].content.should == "blah"
    end

    it "updates a section" do
      Factory.build(:section, :name => "section1", :content => "foo", :page => page)
      page.update_sections("section1" => { "value" => "blah" } )
      page.should have(1).sections
      page.sections[0].content.should == "blah"
    end

    it "saves the updated section" do
      Factory.build(:section, :name => "section1", :content => "foo", :page => page)
      page.update_sections("section1" => { "value" => "blah" } )
      page.save!
      page.reload.content_for("section1").should == "blah"
    end

    it "returns nil for missing content" do
      page.content_for("foobar").should be_nil
    end
  end
end
