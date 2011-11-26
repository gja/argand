module PagesHelper
  def editable(tag_type, id, options = {})
    options = options.clone
    options[:data] = (options[:data] || {}).clone.merge(:type => "editable")
    options[:class] = options[:class].present? ? "#{options[:class]} mercury-region" : "mercury-region"
    options[:id] = id
    content_tag(tag_type, @page.content_for(id).try(&:html_safe), options)
  end
end
