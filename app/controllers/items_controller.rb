class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new 
    @item = Item.new
  end

  def information
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @orders = User.where(created_at: @month.all_month)
    @now = Time.now.strftime('%Y%m%d')
    
  end
end
