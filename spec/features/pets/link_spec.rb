require 'rails_helper'

RSpec.describe "Pet Links" do
  it "can click on pet name and be directed to show page" do
    shelter = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)
    pet_1 = Pet.create(name: "Spot", age: 5, sex: "Male", shelter_id: shelter.id)
    pet_2 = Pet.create(name: "Oliver", age: 4, sex: "Male", shelter_id: shelter.id)

    visit '/pets'

    click_on "#{pet_1.name}"

    expect(current_path).to eq("/pets/#{pet_1.id}")
  end

  it "it can link to pet index from any page" do
    shelter = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)
    pet = shelter.pets.create(image: "/app/assets/images/oliver.png", name: "Oliver", age: 4, sex: "male", shelter_id: shelter.id)

    visit "/shelters/#{shelter.id}"
    click_on "Pet Index"
    expect(current_path).to eq("/pets")


    visit '/shelters/new'
    click_on "Pet Index"
    expect(current_path).to eq("/pets")

    visit "/pets/#{pet.id}"
    click_on "Pet Index"
    expect(current_path).to eq("/pets")
  end

  describe "When on shelters show page" do
    it "has a link to its pets index" do
      shelter = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)
      pet_1 = Pet.create(name: "Spot", age: 5, sex: "Male", shelter_id: shelter.id)
      pet_2 = Pet.create(name: "Oliver", age: 4, sex: "Male", shelter_id: shelter.id)

      visit "shelters/#{shelter.id}/"

      click_on "Pets"

      expect(current_path).to eq("/shelters/#{shelter.id}/pets")
    end
  end
end
