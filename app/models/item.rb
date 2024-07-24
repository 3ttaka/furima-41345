class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_fee_bearer_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_price, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :shopping_fee_bearer
  belongs_to :prefecture
  belongs_to :shopping_day
  has_many :comments
  belongs_to :user
  has_one :order_history
end
