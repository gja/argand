class PagesController < ApplicationController
  def show_page(page_name)
    @page = Page.find_by_name(page_name)
    render @page.template
  end

  def show
    show_page(params[:page_name])
  end

  def update
    @page = Page.find_by_name(params[:page_name])
    @page.update_sections(JSON.parse(params[:content]))
    @page.save!
    render text: ""
  end

  def root
    if Page.exists?(:name => "root")
      show_page("root")
    else
      redirect_to "/admin"
    end
  end
end
