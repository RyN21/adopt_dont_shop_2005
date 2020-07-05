require 'rails_helper'

RSpec.describe "Pet Update from Pet Index page" do
  describe "when on pet index page" do
    it "can got to pet edit page" do
      shelter_1 = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)
      pet_1 = Pet.create(name: "Spot", age: 5, sex: "Male", shelter_id: shelter_1.id)
      pet_2 = Pet.create(name: "Oliver", age: 4, sex: "Male", shelter_id: shelter_1.id)

      visit '/pets'

      click_on "Delete #{pet_1.name}"

      expect(current_path).to eq("/pets")
      expect(page).to_not have_content("Spot")
      expect(page).to have_content("Oliver")
    end
  end

  describe "when on shelter pet index page" do
    it "can go to pet edit page" do
      shelter_1 = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)
      pet_1 = Pet.create(name: "Spot", age: 5, sex: "Male", shelter_id: shelter_1.id)
      pet_2 = Pet.create(name: "Oliver", age: 4, sex: "Male", shelter_id: shelter_1.id)

      visit "shelters/#{shelter_1.id}/pets"

      click_on "Delete #{pet_1.name}"

      expect(current_path).to eq("/pets")
      expect(page).to_not have_content("Spot")
      expect(page).to have_content("Oliver")
    end
  end
end
