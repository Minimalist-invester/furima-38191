class OrderForm
  include ActiveModel::Model
  attr_accessor :postcode, :prefecure_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token

  validates :user_id, presence: true
  validates :item_id, presence: true

  validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecure_id, numericality: { other_than: 1 }
  validates :city, presence: true
  validates :block, presence: true
  validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
  validates :token, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode_id: postcode, prefecure_id: prefecure_id, city: city, block: block, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end