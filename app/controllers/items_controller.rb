class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:destroy,:edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :sold_out_redirect, only:[:show]

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

  def update
    
    if @item.update(item_params)
     redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show   #エラーハンドリング
    end
  end



  private

  def sold_out_redirect
    @item = Item.find(params[:id])
    redirect_to root_path if Address.exists?(item:@item)
  end

  def item_params
    params.require(:item).permit(:name,:image,:description,:price,:category_id,:state_id,:postage_id,:region_id,:shipping_date_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
