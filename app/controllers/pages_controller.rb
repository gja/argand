class PagesController < ApplicationController
  def show
    @page = Page.find_by_name(params[:page_name])
    render "#{Rails.root}/templates/#{@page.template}"
  end

  def update
    @page = Page.find_by_name(params[:page_name])
    @page.update_sections(JSON.parse(params[:content]))
    @page.save!
    render text: ""
  end
end
