class PetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]

  def index
    if params[:status] == "found"
      @pets = Pet.where(status: "found")
    elsif params[:status] == "lost"
      @pets = Pet.where(status: "lost")
    else 
      @pets = Pet.all 
    end
  end

  def new
    @pet = Pet.new
    @status = params[:status]
  end

  def destroy
    @pet = current_user.pets.find(params[:id])
    id = params[:id]
    pet = Pet.find_by(id: id)
    pet.destroy
    flash[:danger] = "Post deleted"
    redirect_to "/"
  end

  def edit
    @pet = current_user.pets.find(params[:id])
    id = params[:id]
    @pet = Pet.find_by(id: id)
  end
  
  def update
    id = params[:id]
    pet = Pet.find_by(id: id)
    pet.update(pet_params)
    flash[:notice] = "Post Updated"
    redirect_to "/pets/#{pet.id}"
  end

   def create
    new_pet = params[:pet]
    new_pet_images = params[:pet][:pet_images]
    @pet = Pet.new(name: new_pet["name"], animal: new_pet["animal"], breed: new_pet["breed"], color: new_pet["color"], weight: new_pet["weight"], size: new_pet["size"], micro_chip: new_pet ["micro_chip"], description: new_pet["description"], status: new_pet["status"], location: new_pet["location"])
    @pet.user_id = current_user.id 
    @pet.status = params[:status]
    
    if @pet.save
      new_pet_images.each do |pet_image|
        PetImage.create(name: pet_image, pet_id: @pet.id )
      end
      flash[:success] = "Pet Created"
      redirect_to "/pets/#{@pet.id}"
      else
      render :new
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end
    
  def search
    @pets =  
    search_term = params[:search]
    @pets = Pet.where("name LIKE ? OR color LIKE ? OR size LIKE ? or animal LIKE ? or breed LIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    render :index
  end



private

  def pet_params
    params.require(:pet).permit(:name, :animal, :breed, :color, :weight, :size, :micro_chip, :description, :status, :location, :pet_images)
  end
end
