class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  #before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
    @deliveryprice = Item.includes(:deliverry_charge)
    
  end


  def new
     @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

   private
   def item_params
     params.require(:item).permit(:item_name, :image, :description, :category_id, :status_id, :deliverry_charge_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
   end

end
