class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  def index
    @rentals = Rental.all
  end

  def show
  end

  def new
    @rental = Rental.new
    2.times { @rental.stations.build }
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      redirect_to rentals_path, notice:'物件情報を登録しました'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @rental.update(rental_params)
      redirect_to rentals_path, notice:'物件情報を編集しました'
    else
      render action: 'edit'
    end
  end

  def destroy
    @rental.destroy
    redirect_to rentals_path, notice:'物件情報を削除しました'
  end

  private
    def rental_params
      params.require(:rental).permit(:name, :rent, :address, :building_age, :remarks, stations_attributes: [:line_name, :station_name, :time, :id])
    end

    def set_rental
      @rental = Rental.find(params[:id])
    end
end
