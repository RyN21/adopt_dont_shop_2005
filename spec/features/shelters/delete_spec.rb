require 'rails_helper'

RSpec.describe "Delete a Shelter" do
  describe "As a visitor to the shelter index page" do
    it "can delete a shelter" do
      shelter_1 = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)
      shelter_2 = Shelter.create(name: "Adopt a Fish", address: "233 Alameda Ave..", city: "Denver", state: "CO", zip: 80516)
      shelter_3 = Shelter.create(name: "Adopt a Chicken", address: "459 Colfax Ave.", city: "Lakewood", state: "CO", zip: 80015)

      visit "/shelters/#{shelter_1.id}"

      click_on "Delete"

      expect(current_path).to eq('/shelters')
      expect(page).to_not have_content('Adopt a Dog')
      expect(page).to have_content('Adopt a Fish')
    end
  end
end
