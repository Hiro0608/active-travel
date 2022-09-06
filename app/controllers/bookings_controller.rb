class BookingsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @booking = Booking.new
    @bookings = Booking.where(user_id: @user.id)
  end

  # def new
  #   @booking = Booking.new
  #   @aaa = 
  # end

  def create
    @booking = Booking.new(booking_params)
    @user = @booking.user
    if @booking.save
    redirect_to "/users/#{@user.id}/bookings"
    else
    redirect_to "/users/#{@booking.user_id}"
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def edit
    @booking = Booking.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @booking = Booking.find(params[:id])
    @user = User.find(params[:user_id])
    if @booking.update(booking_params)
      redirect_to "/users/#{@user.id}/bookings/#{@booking.id}"
    else
      redirect_to "/users/#{@user.id}/bookings/#{@booking.id}/edit"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @user = @booking.user
    if @booking.destroy
      redirect_to "/users/#{@user.id}/bookings"
    end
  end


  private
  def booking_params
    params.require(:booking).permit(:price, :text, :start_time).merge(user_id: params[:user_id])
  end
end



