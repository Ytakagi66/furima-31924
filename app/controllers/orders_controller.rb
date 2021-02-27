class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def new
    @order_shipping = OrderShipping.new
  end

  def create
    binding.pry
    @order_shipping = OrderShipping.new(shipping_params)
    @order_shipping.save
    redirect_to action: :index
  end

  private

  def shipping_params
    params.permit(:number, :exp_month, :exp_year, :cvc, :postal_code, :city, :address, :building, :phone_number, :prefecture, :item_id).merge(user_id: current_user.id)
  end
end

