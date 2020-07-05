require 'rails_helper'

RSpec.describe "Shelter Links" do
  it "can click on shelter name and be directed to show page" do
    shelter_1 = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)

    visit '/shelters'

    click_on "#{shelter_1.name}"

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
  end

  it "it can link to shelter index from any page" do
    shelter = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)
    pet = shelter.pets.create(image: "/app/assets/images/oliver.png", name: "Oliver", age: 4, sex: "male", shelter_id: shelter.id)

    visit '/pets'
    click_on "Shelter Index"
    expect(current_path).to eq("/shelters")


    visit "/shelters/#{shelter.id}"
    click_on "Shelter Index"
    expect(current_path).to eq("/shelters")

    visit "/pets/#{pet.id}"
    click_on "Shelter Index"
    expect(current_path).to eq("/shelters")
  end
end
