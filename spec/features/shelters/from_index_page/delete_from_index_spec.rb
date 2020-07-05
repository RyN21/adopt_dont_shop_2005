require 'rails_helper'

RSpec.describe "Delete from Shelter Index page" do
  it "can update shelter from clicking edit from shelter index page" do
    shelter_1 = Shelter.create(name: "Paws and Claws Rescue", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)
    shelter_2 = Shelter.create(name: "Splashy Pets", address: "233 Alameda Ave..", city: "Denver", state: "CO", zip: 80516)
    shelter_3 = Shelter.create(name: "Peck and Go", address: "459 Colfax Ave.", city: "Lakewood", state: "CO", zip: 80015)

    visit '/shelters'

    click_on "Delete #{shelter_1.name}"

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content("Paws and Claws Rescue")
  end
end
