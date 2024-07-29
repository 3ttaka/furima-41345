class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input half-width characters.' }
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order_history = OrderHistory.create(user_id:, item_id:)
    delivery = Delivery.create(postal_code:, prefecture_id:, city:, address:,
                               building_name:, phone_number:, order_history_id: order_history.id)
  end
end
