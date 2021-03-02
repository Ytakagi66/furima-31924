class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :redirect_item, :order_present, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
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

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:name, :info, :price, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :scheduled_id,
                                 :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_item
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def order_present
    redirect_to root_path if @item.order.present?
  end
end
