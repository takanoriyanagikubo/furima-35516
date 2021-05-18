class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, ]

  def index
    @items = Item.all.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end


  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def move_to_index
    item = Item.find(params[:id])
    if item.user_id != current_user.id
      redirect_to action: :index
    end
  end

   private
   def item_params
     params.require(:item).permit(:item_name, :image, :description, :category_id, :status_id, :deliverry_charge_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
   end

end
