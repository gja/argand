class Page < ActiveRecord::Base
  validates_presence_of :template
  validates :name, presence: true, uniqueness: true, format: /^[0-9a-zA-Z\-_]*$/
  has_many :sections, :autosave => true

  def section_by_name(name)
    sections.detect { |section| section.name == name } || sections.build(name: name)
  end

  def update_sections(section_data)
    section_data.each do |name, values|
      section_by_name(name).content = values["value"]
    end
  end

  def content_for(name)
    section = sections.find_by_name(name)
    section.present? ? section.content : nil
  end
end
