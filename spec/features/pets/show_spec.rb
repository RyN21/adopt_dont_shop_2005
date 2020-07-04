require 'rails_helper'

RSpec.describe "Pets show page" do
  it "can see the the pets information based on pets ID" do
    shelter_1 = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)
    shelter_2 = Shelter.create(name: "Adopt a Fish", address: "233 Alameda Ave..", city: "Denver", state: "CO", zip: 80516)
    shelter_3 = Shelter.create(name: "Adopt a Chicken", address: "459 Colfax Ave.", city: "Lakewood", state: "CO", zip: 80015)

    pet_1 = Pet.create(name: "Jake", age: 5, sex: "Male", shelter_id: shelter_2.id)
    pet_2 = Pet.create(name: "Olvier", age: 4, sex: "Male", shelter_id: shelter_1.id)

    visit "/pets/#{pet_1.id}"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(shelter_2.name)
    expect(page).to_not have_content(shelter_1.name)
    expect(pet_1.adoptable?).to eq(true)
    expect(pet_1.pending?).to eq(false)
  end
end
