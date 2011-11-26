class PagesController < ApplicationController
  def show
  end

  def update
    render text: ""# YAML.dump(params)
  end
end
