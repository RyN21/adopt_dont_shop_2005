require 'rails_helper'

RSpec.describe 'Pets Index' do
    it "can see list of all pets in the system including attributes" do
      pet_1 = Pet.create(image: "/app/assets/images/oliver.png", name: "Olvier", age: 4, sex: "male")

      visit '/pets'


      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.sex)
  end
end
