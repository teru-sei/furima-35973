class ItemsController < ApplicationController
  def index
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :category_id, :condition_id, :delivery_price_id,
                                 :delivery_day_id, :prefecture_id, :item_price).merge(user_id: current_user.id)
  end
end
