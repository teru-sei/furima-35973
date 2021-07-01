class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase_history

  def index
    redirect_to root_path if current_user.id == @item.user.id || @purchase_history_id.nil?
    @purchase_history_purchase = PurchaseHistoryPurchase.new
  end

  def create
    @purchase_history_purchase = PurchaseHistoryPurchase.new(purchase_history_params)
    if @purchase_history_purchase.valid?
      pay_item
      @purchase_history_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  def purchase_history_params
    params.require(:purchase_history_purchase).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      token: params[:token], item_id: params[:item_id], user_id: current_user.id
    )
  end

  def set_purchase_history
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.item_price,
      card: purchase_history_params[:token],
      currency: 'jpy'
    )
  end
end
