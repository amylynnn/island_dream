class IslandsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  before_action :set_island, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @islands = Island.search_by_location_and_name(params[:query])
    else
      @islands = Island.all
    end
  end

  def new
    @island = Island.new
  end

  def show
    @island = Island.find(params[:id])
  end

  def create
    @island = Island.new(island_params)
    @island.user = current_user
    if @island.save
      redirect_to islands_path(@island)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @island.update(island_params)
    redirect_to island_path(@island)
  end

  def destroy
    @island.destroy
    redirect_to islands_path, status: :see_other
  end

  private

  def set_island
    @island = Island.find(params[:id])
  end

  def island_params
    params.require(:island).permit(:location, :price, :name, photos: [])
  end
end
