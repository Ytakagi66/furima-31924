class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(params[:id])
    redirect_to action: :new
  end

  def price
    binding.pry
    item = Item.find(content: params[:price])
    if item.checked 
      item.update(price: false)
    else
      item.update(price: true)
    end
    item = Item.find(params[:id])
    render json: { post: item }
  end

  def item_params
    params.require(:item).permit(:name, :info, :price,:category_id, :status_id, :shipping_fee_id, :prefecture_id, :scheduled_id, :image)
  end
end