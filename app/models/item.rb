class Item < ApplicationRecord
  belongs_to :user
  has_one    :order_history

  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_fee_bearer_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_price, presence: true,
                         numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :shopping_fee_bearer
  belongs_to :prefecture
  belongs_to :shopping_day
  belongs_to :user
  has_one_attached :image
end
