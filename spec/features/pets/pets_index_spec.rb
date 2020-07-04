require 'rails_helper'

RSpec.describe 'Pets Index' do
    it "can see list of all pets in the system including attributes" do
      shelter_1 = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)

      pet_1 = shelter_1.pets.create(image: "/app/assets/images/oliver.png", name: "Oliver", age: 4, sex: "male", shelter_id: shelter_1.id)

      visit "/pets"


      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.sex)
      expect(page).to have_content(pet_1.age)
  end
end
