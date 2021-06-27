class PurchaseHistory < ApplicationRecord
  belongs to :user
  belongs_to :item
  has_one :purchase
end
