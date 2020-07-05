require 'rails_helper'

RSpec.describe "Pet Creation" do
  it "can add a pet to the shelter pet index" do
    shelter_1 = Shelter.create(name: "Adopt a Dog", address: "423 Broadway Blvd.", city: "Denver", state: "CO", zip: 80215)
    shelter_2 = Shelter.create(name: "Adopt a Fish", address: "233 Alameda Ave..", city: "Denver", state: "CO", zip: 80516)
    shelter_3 = Shelter.create(name: "Adopt a Chicken", address: "459 Colfax Ave.", city: "Lakewood", state: "CO", zip: 80015)
    visit "/shelters/#{shelter_1.id}"

    click_on "Pets"

    visit "/shelters/#{shelter_1.id}/pets"

    click_on "Create Pet"


    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

    attach_file :image, paths: "app/assets/images/oliver.PNG"
    fill_in :name, with: "Marley"
    fill_in :description, with: "Pitbull mix"
    fill_in :age, with: "3"
    fill_in :sex, with: "male"
    # upload an image
    click_button "Create Pet"

    new_pet = Pet.last

    # use launchy gem to 'save_and_open_page' to verify image displaying on page
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content("Marley")
    expect(page).to have_css("#pet-image-#{new_pet.id}")

    asset_exists?('app/assets/images/oliver.PNG')
    # assert uploaded image exists
    # assert pet object has correct image_path attribute

    # somehow we need to figure out how to assert there is an actual image here
    # in this case we would expect new_pet.image_path to eq("/app/assets/images/pets/pet-#{new_pet.id}.png")
    # we should expect that file to actually be there
    # and we should expect it to look right on the screen
    # Also remember to test this in other places

    expect(new_pet.adoptable?).to eq(true)
    # assert correct image on page
  end
end



# When I fill in the form with the pet's:
# - image

# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
