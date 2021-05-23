class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:create, :index]

  
  def index
    @bought = Bought.new
  end
 
  def create
    @bought = Bought.new(bought_params)
    if @bought.valid?
      pay_item
      @bought.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  def move_to_index
      @item = Item.find(params[:item_id])
      if @item.user_id == current_user.id || @item.buy.present?
        redirect_to controller: :items
      end
  end

  private

  def bought_params
    params.require(:bought).permit(:postal_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: bought_params[:token], 
        currency: 'jpy'
      )
  end

end