require 'rails_helper'

RSpec.describe "Shelter Pets Index" do
  it "can show each pet that can be adopted from the shelter with that shelter_id including the pet's" do
    shelter_1 = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)
    shelter_2 = Shelter.create(name: "Adopt a Fish", address: "233 Alameda Ave..", city: "Denver", state: "CO", zip: 80516)
    shelter_3 = Shelter.create(name: "Adopt a Chicken", address: "459 Colfax Ave.", city: "Lakewood", state: "CO", zip: 80015)

    pet_1 = Pet.create(image: "/app/assets/images/oliver.PNG", name: "Spot", age: 5, sex: "Male", shelter_id: shelter_1.id)
    pet_2 = Pet.create(image: "/app/assets/images/oliver.PNG", name: "Oliver", age: 4, sex: "Male", shelter_id: shelter_1.id)
    pet_3 = Pet.create(image: "/app/assets/images/oliver.PNG", name: "Frank", age: 3, sex: "Male", shelter_id: shelter_3.id)

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to_not have_content(pet_3.age)
  end
end
