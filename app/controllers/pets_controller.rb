class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def index_by_shelter
    @shelter = Shelter.find(params[:shelter_id])
    @pets = Pet.all
    @all = []

    @all = @pets.find_all do |pet|
      pet.shelter_id == @shelter.id
    end
  end

  def show
    @pet = Pet.find(params[:id])
    @shelter = Shelter.find(@pet.shelter_id)
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    require "pry"; binding.pry
    shelter = Shelter.find(params[:shelter_id])
    shelter.pets.create(pet_params)
    redirect_to("/shelters/#{shelter.id}/pets")
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to "/pets/#{@pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to "/pets"
  end

  private

  def pet_params
    params.permit(:image, :name, :age, :sex, :shelter_id)
  end
end
