class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order

  belongs_to :category
  belongs_to :condition
  belongs_to :bearer
  belongs_to :prefecure
  belongs_to :ship_date
  has_one_attached :image

  validates :product, presence: true, length: { maximum: 40 }
  validates :product_description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: ' must be within 300~9999999' }
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :bearer_id, presence: true, numericality: { other_than: 1 }
  validates :prefecure_id, presence: true, numericality: { other_than: 1 }
  validates :ship_date_id, presence: true, numericality: { other_than: 1 }
  validates :image, presence: true
end