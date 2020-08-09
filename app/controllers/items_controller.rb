class ItemsController < ApplicationController
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

     


  private

  def item_params
    params.require(:item).permit(:name,:image,:description,:price,:category_id,:state_id,:postage_id,:region_id,:shipping_date_id).merge(user_id: current_user.id)
  end
end
