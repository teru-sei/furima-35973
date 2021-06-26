class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :post_code
    validates :prefecture_id { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number
  end

  belongs to :purchase_history
end