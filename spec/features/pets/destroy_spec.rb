require 'rails_helper'

RSpec.describe "Destroy Pet" do
  it "can delete a pet from the pet list" do
    shelter_1 = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)
    pet_1 = shelter_1.pets.create(image: "/app/assets/images/oliver.png", name: "Oliver", age: 4, sex: "male", shelter_id: shelter_1.id)

    visit "/pets/#{pet_1.id}"

    click_on "Delete Pet"

    expect(current_path).to eq("/pets")
    expect(page).to_not have_content(pet_1.name)
  end
end
