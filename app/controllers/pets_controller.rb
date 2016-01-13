class PetsController < ApplicationController

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
  end

  def edit
  end

  def update
  end

   def create

    # name = params[:pet][:name]
    # animal = params[:pet][:animal]
    # breed = params[:pet][:breed]
    # color = params[:pet][:color]
    # weight = params[:pet][:weight]
    # size = params[:pet][:size]
    # micro_chip = params[:pet][:micro_chip]
    # description = params[:pet][:description]
    #throw "abc"
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

  # def lost
  #   @pet = Pet.new  
  # end

private

  def pet_params
    params.require(:pet).permit(:name, :animal, :breed, :color, :weight, :size, :micro_chip, :description, :status, :image)
  end
end
