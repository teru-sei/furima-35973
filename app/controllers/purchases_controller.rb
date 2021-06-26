class PurchasesController < ApplicationController
  def index
     @item = Item.find(params[:item_id])
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @opurchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:post_code, :prefecture_id, :city, :address, :phone_number)
  end
end