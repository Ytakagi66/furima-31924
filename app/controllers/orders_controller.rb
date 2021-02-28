class OrdersController < ApplicationController

  def index
    @order = Order.new
    set_item
    @order_shipping = OrderShipping.new
  end

  def new
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(shipping_params)
    if @order_shipping.valid?
      set_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵の設定
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: shipping_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      binding.pry
      @order_shipping.save　# order_shipping.rbに記述されたsaveメソッド
     redirect_to root_path
    else
      set_item
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def shipping_params
    set_item
    params.require(:order_shipping).permit(:postal_code, :city, :address, :building, :phone_number, :prefecture_id).merge(user_id: current_user.id, token: params[:token], item_id: @item.id)
  end
end