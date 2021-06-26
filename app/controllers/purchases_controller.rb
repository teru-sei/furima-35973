class PurchasesController < ApplicationController
  def index
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(order_params)
    if @opurchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:purchase).permit(:price)
  end
end
