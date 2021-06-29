class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, only: :index
  
  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id
      redirect_to root_path
    end
    @purchase_history_purchase = PurchaseHistoryPurchase.new
  end

  def create
    @purchase_history_purchase = PurchaseHistoryPurchase.new(purchase_history_params)
    @item = Item.find(params[:item_id])
    if @purchase_history_purchase.valid?
       @purchase_history_purchase.save
       redirect_to root_path
    else
      render :index
    end
  end

  def purchase_history_params
    params.require(:purchase_history_purchase).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end
end
