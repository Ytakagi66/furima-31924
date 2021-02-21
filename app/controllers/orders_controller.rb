class OrdersController < ApplicationController
  include ActiveModel::Model
  attr_accessor :number, :cvc, :exp_month, :exp_year, :postal_code, :prefecture, :city, :address, :building, :phone_number

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:price)
  end
end