class PurchaseHistoryPurchase
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :token, :user_id

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :token

    with_options length: { minimum: 10, message: "is too short" },
                 format: { with: /\A\d{10}$|^\d{11}\z/, message: "is invalid. Input only number" } do
      validates :phone_number
    end
  end

  def save
    purchase_history = PurchaseHistory.create(item_id: item_id, user_id: user_id)
    Purchase.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, token: token, purchase_history_id: purchase_history.id)
  end
end