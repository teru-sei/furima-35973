class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_description
    validates :category_id
    validates :condition_id
    validates :delivery_price_id
    validates :delivery_day_id
    validates :preference_id
    validates :item_price

    with_options foreign_key: true do
      validates :user
    end
  end

  belongs_to :user
  has_one :purchase_history
  has_one_attached :image
end
