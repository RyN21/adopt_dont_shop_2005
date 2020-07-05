require 'rails_helper'

RSpec.describe "Shelter Update from Shelter Index page" do
  it "can update shelter from clicking edit from shelter index page" do
    shelter_1 = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)
    shelter_2 = Shelter.create(name: "Adopt a Fish", address: "233 Alameda Ave..", city: "Denver", state: "CO", zip: 80516)
    shelter_3 = Shelter.create(name: "Adopt a Chicken", address: "459 Colfax Ave.", city: "Lakewood", state: "CO", zip: 80015)

    visit '/shelters'

    click_on "Edit #{shelter_1.name}"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
  end
end
