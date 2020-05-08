class CityController < ApplicationController
  def index
    @cities = City.all
  end
  
  def show
    @city = City.find(params[:id])
    @gossips_city = City.find(params[:id]).gossips
  end
  
  def new
    @city = City.new
  end
  
  def create
    @city = City.new(name: params[:name], zip_code: params[:zip_code])
  end
    
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
end
