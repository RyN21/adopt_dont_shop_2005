require 'rails_helper'

RSpec.describe "Update an existing shelter" do
  describe "As a visitor to the shelter show page" do
    it "can follow a link to update a shelter" do
      shelter_1 = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)

      visit "/shelters/#{shelter_1.id}"

      click_on "Edit"

      expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
      fill_in :name, with: 'Adopt a Squirrel'
      fill_in :address, with: '423 Broadway Blvd.'
      fill_in :city, with: 'Denver'
      fill_in :state, with: 'CO'
      fill_in :zip, with: '80214'

      click_on 'Update'

      expect(current_path).to eq("/shelters/#{shelter_1.id}")
      expect(page).to have_content('Adopt a Squirrel')
    end
  end
end
