class ItemsController < ApplicationController
  def index
  end

  def create
    @item = Item.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :category_id, :condition_id, :delivery_price_id, :delivery_day_id, :preference_id, :item_price).merge(user_id: current_user.id)
  end
end
