class Purchase < ApplicationRecord
  attr_accessor :token, :item_id
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :post_code
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number
    validates :token
  end

  belongs_to :purchase_history
end