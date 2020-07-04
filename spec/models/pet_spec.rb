
require 'rails_helper'

RSpec.describe Pet do
  describe 'validations' do
    it { should validate_presence_of :name}
  end
  describe 'relationships' do
    shelter_1 = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)
    pet_2 = Pet.create(name: "Olvier", age: 4, sex: "Male", shelter: "Adopt a Dog")

    it { should belong_to :shelter}
  end
end
