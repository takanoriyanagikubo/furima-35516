class ItemsController < ApplicationController

  def index
  end


  def new
     #@item = Item.new(prototype_params)
  end



  def create  
    @user = User.new(user_params)
    
    if @user.save
      redirect_to root_path
    else
      render partial: "form"
    end
  end

  def destroy
    
      @prototype = Prototype.find(params[:id])
      if @prototype.destroy
        redirect_to root_path
       else
        render partial: "form"
      end
   

  end
end
