class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
  end

  def new
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(shipping_params)
    if @order_shipping.valid?
      @order_shipping.save
     redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def shipping_params
    params.permit(:number, :exp_month, :exp_year, :cvc, :postal_code, :city, :address, :building, :phone_number, :prefecture_id, :item_id).merge(user_id: current_user.id)
  end
end

