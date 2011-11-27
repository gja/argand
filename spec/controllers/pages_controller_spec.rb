require 'spec_helper'

describe PagesController do
  context "GET show" do
    it "shows the correct page" do
      page = Factory(:page)
      get :show, :page_name => page.name
      response.should be_success
      assigns[:page].should == page
      response.should render_template page.template
    end

    it "shows a page not found if it cannot find the page" do
      page = Factory(:page, :name => "not_found")
      get :show, :page_name => "foobar"
      response.should be_not_found
      assigns[:page].should == page
      response.should render_template page.template
    end

    it "shows a text message if there is no not_found defined as well" do
      get :show, :page_name => "foobar"
      response.should be_not_found
      response.body.should == "Page not found. Create a page named not_found to handle this error"
    end
  end

  context "GET root" do
    it "shows the root page if it exists" do
      page = Factory(:page, :name => "root")
      get :root
      response.should be_success
      assigns[:page].should == page
      response.should render_template page.template
    end

    it "redirects to the admin page if there is nothing found" do
      get :root
      response.should redirect_to '/admin'
    end
  end

  context "POST update" do
    it "updates the page" do
      page = Factory(:page)
      post :update, :page_name => page.name, :content => { "section1" => { "value" => "foo" } }.to_json
      response.should be_success
      response.body.should == "" # needed for mercury
      page.reload.content_for("section1").should == "foo"
    end
  end
end
