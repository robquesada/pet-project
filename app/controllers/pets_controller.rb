class PetsController < ApplicationController

  def new
    @pet = Pet.new
    @editing = false
  end
  
  def create
    @pet = Pet.new(pet_params)
    @pet.id_user = current_user.id
    if @pet.save
      redirect_to @pet
    else
      render 'new'
    end
  end

  def show
    @pet = Pet.find(params[:id])
    @animal_type = AnimalType.find(@pet.id_animal_type)
    @breed = Breed.find(@pet.id_breed)
  end

  def index
    @pets = Pet.where(id_user: current_user.id)
  end

  def edit
    @pet = Pet.find(params[:id])
    @editing = true
  end

  def update
    @pet = Pet.find(params[:id])
 
    if @pet.update(pet_params)
      redirect_to @pet
    else
      render 'edit'
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
 
    redirect_to pets_path
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :id_animal_type, :id_breed, :description, :sex, :avatar, :id_user)
    end

end