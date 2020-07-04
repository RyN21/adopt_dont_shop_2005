class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end
  #
  # def show
  #   @pet = Pet.find(params[:id])
  # end
  #
  # def view
  #   @shelters = Shelter.all
  #   @shelter_id = params[:shelter_id]
  #   @shelter = @shelters.find do |shelter|
  #     @shelter_id.to_i == shelter.id
  #   end
  #   @pets = Pet.all
  #   @pets_from_shelter = @pets.find_all do |pet|
  #     @shelter.name == pet.shelter
  #   end
  #   @pets_from_shelter
  # end
  #
  # def new
  #   @shelter_id = params[:shelter_id]
  # end
  #
  # def create
  #   require "pry"; binding.pry
  #   shelter = Shelter.find(params[:shelter_id])
  #   new_pet = shelter.pets.create(pet_params)
  #   redirect_to("/shelters/#{shelter.id}/pets/#{new_pet.id}")
  # end
  #
  # private
  # def pet_params
  #   params.permit(:name, :age, :sex)
  # end
end
