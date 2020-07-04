require 'rails_helper'

RSpec.describe "Update Pet" do
  it "can update a pets information" do
    shelter_1 = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)
    pet_1 = shelter_1.pets.create(image: "/app/assets/images/oliver.png", name: "Oliver", age: 4, sex: "male", shelter_id: shelter_1.id)

    visit "/pets/#{pet_1.id}"

    click_on "Update Pet"

    expect(current_path).to eq("/pets/#{pet_1.id}/edit")

    # fill_in :image, with: "/app/assets/images/oliver.PNG"
    fill_in :name, with: "Marley"
    fill_in :description, with: "Pitbull mix"
    fill_in :age, with: "3"
    fill_in :sex, with: "male"

    click_button "Update Pet"

    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content("Marley")
  end
end
