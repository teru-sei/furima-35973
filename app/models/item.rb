class Item < ApplicationRecord
  attr_accessor :user_id
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_price
  belongs_to :delivery_day
  belongs_to :prefecture

  with_options presence: true do
    validates :image
    validates :item_name, length: { maximum: 40 }
    validates :item_description, length: { maximum: 1000 }
    validates :category_id
    validates :condition_id
    validates :delivery_price_id
    validates :delivery_day_id
    validates :prefecture_id
    validates :item_price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
  end
  validates :item_price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :delivery_price_id
    validates :delivery_day_id
    validates :prefecture_id
  end

  belongs_to :user
  has_one :purchase_history
  has_one_attached :image
end
