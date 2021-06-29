class Purchase < ApplicationRecord
  attr_accessor :token, :user_id, :item_id

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  belongs_to :purchase_history
end
