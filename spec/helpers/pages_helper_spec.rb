require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PagesHelper. For example:
#
# describe PagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe PagesHelper do
  before(:each) do
    page = Factory(:page)
    section = Factory(:section, :name => "foo", :content => "bar", :page => page)
    helper.instance_variable_set("@page", page)
  end

  let(:params) { { :data => {:type => "editable"}, :id => "foo", :class => "mercury-region" } }

  it "calls a div tag when asked for an editable div" do
    helper.should_receive(:content_tag).with(:div, "bar", params)
    helper.editable(:div, "foo")
  end

  it "returns nil even if no content is found" do
    helper.should_receive(:content_tag).with(:div, nil, params.merge(:id => "bar"))
    helper.editable(:div, "bar")
  end

  it "merges classes" do
    helper.should_receive(:content_tag).with(:div, "bar", params.merge(:class => "foo mercury-region"))
    helper.editable(:div, "foo", :class => "foo")
  end

  it "merges data-type" do
    helper.should_receive(:content_tag).with(:div, "bar", params.merge(:data => {:foo => "bar", :type => "editable"} ))
    helper.editable(:div, "foo", :data => {:foo => "bar"})
  end
end
