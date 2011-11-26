require 'spec_helper'

describe Section do
  it { should belong_to :page }
end
