class SpicesController < ApplicationController

  #GET /spices, GET request return an array of all spices from the database:
  def index
  spices = Spice.all
  render json: spices
  end
    
  #GET /spices/:id, GET individual spice from the database: 
  # def show 
  #     spice = Spice.find_by(id: params[:id])
  #     if spice
  #         render json: spice
  #     else
  #         render json: {error: "spice is not found"}, status: :not_found
  #      end 
  #     end
 
  #POST /spices, POST / create a new spice in the database 
  def create
  spice = Spice.create(spice_params)
  render json: spice, status: :created
  end
 
  #PATCH /spices/:id, PATCH / update an existing spice in the database 
  def update
  spice = Spice.find_by(id: params[:id])
  if spice
  spice.update(spice_params)
  render json: spice
  else
  render json: { error: "spice not found"}, status: :not_found
  end
  end

  #DELETE /spices/:id, DELETE / delete an existing spice from the database 
  def destroy
  spice = Spice.find_by(id: params[:id])
  if spice
  spice.destroy
  head :no_content
  else
  render json: { error: "Plant not found"}, status: :not_found
  end
  end 
    
  private
  def spice_params
  params.permit(:title, :image, :description, :notes, :rating)
  end
end
