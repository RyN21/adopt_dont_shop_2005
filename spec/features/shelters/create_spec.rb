require 'rails_helper'

RSpec.describe "Create a new Shelter" do
  describe "As a visiter to the shelter index page" do
    it "I can follow a link to create a new shelter" do
      visit '/shelters'
      expect(page).to_not have_content "New Shelter Name"

      click_on "New Shelter"

      expect(current_path).to eq('/shelters/new')

      fill_in :name, with: "New Shelter Name"
      fill_in :address, with: "150 S Parker Rd."
      fill_in :city, with: "Parker"
      fill_in :state, with: "CO"
      fill_in :zip, with: 80012

      click_on "Create Shelter"

      expect(current_path).to eq('/shelters')
      expect(page).to have_content "New Shelter Name"
    end
  end
end
