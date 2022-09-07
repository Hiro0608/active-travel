class ItemsController < ApplicationController
  def index
    @admin = current_admin
    @now = Date.today.month
    @booking = Booking.all.order(start_time: :DESC)
  end

  def information
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @orders = User.where(created_at: @month.all_month)
    @now = Time.now.strftime('%Y%m%d')
    
  end
end
