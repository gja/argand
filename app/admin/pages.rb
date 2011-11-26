ActiveAdmin.register Page do
  index do
    column :id
    column :template
    column :name
    column :created_at
    column :updated_at
    column(:edit_content) {|page| link_to "Edit Content", "/editor/#{page.name}" }
    column(:view_content) {|page| link_to "View Content", "/#{page.name}" }
    default_actions
  end
end
