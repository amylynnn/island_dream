class BookingsController < ApplicationController
  before_action :set_island, only: %i[new create]

  def index
    # @user = current_user
    # @bookings = Booking.all
    @bookings = current_user.bookings
  end

  def new
    @island = Island.find(params[:island_id])
    @booking = @island.bookings.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.island = @island
    # start_date = Date.strptime(params[:booking][:start_dates], '%d/%m/%Y')
    # end_date = Date.strptime(params[:booking][:end_dates], '%d/%m/%Y')
    # @booking = Booking.new(island_id: params[:booking][:island_id], start_dates: start_date, end_dates: end_date)
    @booking.user = current_user
    @booking_days = (@booking.end_dates - @booking.start_dates).to_i
    @booking.price = @island.price * @booking_days
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @booking
    # @booking = Booking.find(params[:id])
    # @island = @booking.island
    # @price = @island.price
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_dates, :end_dates, :price, :number_of_customers, :island_id, :user_id)
  end

  def set_island
    @island = Island.find(params[:island_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
