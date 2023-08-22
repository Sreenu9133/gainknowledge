class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    # @booking = Booking.find(params[:id])

    # @course = Course.find(params[:id])
    Booking.booking_count
  end

  def show
    @booking = Booking.all
    # @course = Course.find(params[:id])
    @booking = Booking.find_by_id(params[:id])
  end

  def new
    @booking = Booking.new(course_id: params[:course_id])
    # @booking = Booking.new
    # @booking = current_user.bookings.new(user_id: params[:current_user])
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      CrudNotificationMailer.create_notification(@booking).deliver_now
      redirect_to bookings_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
     @booking = Booking.find(params[:id])
     if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:first_name, :last_name, :user_id, :course_id, :email, :mobile_number, :address)
  end
end
