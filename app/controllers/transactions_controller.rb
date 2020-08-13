class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :seller_redirect
  before_action :sold_out_redirect


  def index
    @item = Item.find(params[:item_id])
    
  end

  def create
    @item = Item.find(params[:item_id])
    buyer_address = BuyerAddress.new(buyer_address_params)
    if buyer_address.valid?
      pay_item
      buyer_address.save
      redirect_to root_path
    else
      render 'index'
    end
    

  end


  private

  def seller_redirect
    @item = Item.find(params[:item_id])
    redirect_to root_path  if current_user.id == @item.user_id
  end

  def sold_out_redirect
    redirect_to root_path if Address.exists?(item:@item)
  end

  
  def buyer_address_params
    params.permit(:postal_code, :prefecture_id, :city, :block, :building, :phone_number).merge(item_id: @item.id,user_id: current_user.id)
  end

  def order_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
    )
  end


end
