class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :edit_root, only: [:edit, :update, :destroy]
  
  

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
    @items = Item.all
  end

  def edit
  end


  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to edit_item_path
    end
  end

  def move_to_index
    if @item.user_id != current_user.id
      redirect_to action: :index
    end
  end

  def edit_root
    if @item.user_id == current_user.id && @item.buy.present?
      redirect_to action: :index
    end
end



   private
   def item_params
     params.require(:item).permit(:item_name, :image, :description, :category_id, :status_id, :deliverry_charge_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
   end

   def set_item
    @item = Item.find(params[:id])
  end

end
