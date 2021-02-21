class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create

  end

  private

  def order_params
    params.require(:order).permit(:price)
  end
end