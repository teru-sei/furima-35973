class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :delivery_price
    belongs_to :delivery_day
    belongs_to :prefecture

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_description
    validates :category_id
    validates :condition_id
    validates :delivery_price_id
    validates :delivery_day_id
    validates :prefecture_id
    validates :item_price

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_price_id
      validates :delivery_day_id
      validates :prefecture_id
    end
  end

  belongs_to :user
  has_one :purchase_history
  has_one_attached :image
end