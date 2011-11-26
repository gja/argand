class Page < ActiveRecord::Base
  validates_presence_of :template
  validates :name, presence: true, uniqueness: true, format: /^[0-9a-zA-Z\-_]*$/
end
