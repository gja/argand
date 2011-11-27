class PagesController < ApplicationController
  def show_page(page_name, status = :ok)
    @page = Page.find_by_name(page_name)
    render @page.template, :status => status
  end

  def show
    if Page.exists?(:name => params[:page_name])
      show_page(params[:page_name])
    elsif Page.exists?(:name => "not_found")
      show_page("not_found", :not_found)
    else
      render :text => "Page not found. Create a page named not_found to handle this error", :status => :not_found
    end
  end

  def update
    @page = Page.find_by_name(params[:page_name])
    @page.update_sections(JSON.parse(params[:content]))
    @page.save!
    render :text => ""
  end

  def root
    if Page.exists?(:name => "root")
      show_page("root")
    else
      redirect_to "/admin"
    end
  end
end
