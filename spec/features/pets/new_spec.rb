require 'rails_helper'

RSpec.describe "Shelter Pet Creation" do
  it "can add a pet to the shelter pet index" do
    shelter_1 = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)
    shelter_2 = Shelter.create(name: "Adopt a Fish", address: "233 Alameda Ave..", city: "Denver", state: "CO", zip: 80516)
    shelter_3 = Shelter.create(name: "Adopt a Chicken", address: "459 Colfax Ave.", city: "Lakewood", state: "CO", zip: 80015)
    visit "/shelters/#{shelter_1.id}"

    click_on "Pets"

    visit "/shelters/#{shelter_1.id}/pets"

    click_on "Create Pet"


    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

    # fill_in :image, with: "/app/assets/images/oliver.PNG"
    fill_in :name, with: "Marley"
    fill_in :description, with: "Pitbull mix"
    fill_in :age, with: "3"
    fill_in :sex, with: "male"

    click_button "Create Pet"

    new_pet = Pet.last

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content("Marley")
    expect(new_pet.adoptable?).to eq(true)
  end
end



# When I fill in the form with the pet's:
# - image

# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
