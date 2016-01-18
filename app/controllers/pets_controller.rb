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
    # name = params[:name]
    # animal = params[:animal]
    # breed = params[:breed]
    # color = params[:color]
    # size = params[:size]
    # weight = params[:weight]
    # micro_chip = params[:micro_chip]
    # description = params[:description]
    # image = params[:image]
    pet.update(pet_params)
    flash[:notice] = "Post Updated"
    redirect_to "/pets/#{pet.id}"
  end

   def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id 
    @pet.status = params[:status]
      if @pet.save
      flash[:success] = "Post Created"
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
    @pets = Pet.where("name LIKE ? OR description LIKE ? OR size LIKE ? or weight LIKE ? or breed LIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    render :index
  end



private

  def pet_params
    params.require(:pet).permit(:name, :animal, :breed, :color, :weight, :size, :micro_chip, :description, :status, :image, :location)
  end
end
