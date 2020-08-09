class ItemsController < ApplicationController

  before_action :set_item, only: [:show]

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
  end



  private

  def item_params
    params.require(:item).permit(:name,:image,:description,:price,:category_id,:state_id,:postage_id,:region_id,:shipping_date_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
