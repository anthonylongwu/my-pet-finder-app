class PetsController < ApplicationController

  def index
  end

  def new
    @pet = Pet.new
  end

  def destroy
  end

  def edit
  end

  def update
  end

   def create

    name = params[:pet][:name]
    animal = params[:pet][:animal]
    breed = params[:pet][:breed]
    color = params[:pet][:color]
    weight = params[:pet][:weight]
    size = params[:pet][:size]
    micro_chip = params[:pet][:micro_chip]
    description = params[:pet][:description]
    #throw "abc"
    @pet = Pet.create(name: name, animal: animal, breed: breed, color: color, size: size, weight: weight, micro_chip: micro_chip, description: description,)
    if @pet.save
      flash[:success] = "Post Created"
      redirect_to @pet 
    else
      render :new
    end
  end  

  def show
    @pet = Pet.find(params[:id])
  end

  def lost
    @pet = Pet.new
  end


end
