class Api::V1::PetsController < ApplicationController

  def index
    @pets = Pet.all
    render json: @pets 
  end

  def create
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end
  






end
