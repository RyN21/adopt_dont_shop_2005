require 'rails_helper'

RSpec.describe Shelter do
  describe 'validations' do
    it { should validate_presence_of :name }
  end
end

#three things to test for
#- relationships
#- validations
#- class/instance methods
