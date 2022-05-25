class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image, presence: true
  validates  :name, presence: true
  validates  :description, presence: true
  validates  :category_id, presence: true, numericality: { other_than: 0 }
  validates  :status_id, presence: true, numericality: { other_than: 0 }
  validates  :state_id, presence: true, numericality: { other_than: 0 }
  validates  :fee_payer_id, presence: true, numericality: { other_than: 0 }
  validates  :delivery_time_id, presence: true, numericality: { other_than: 0 }

  validates  :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, presence: true

  belongs_to :category
  belongs_to :status
  belongs_to :state
  belongs_to :fee_payer
  belongs_to :delivery_time
  has_one_attached :image

  belongs_to :user
end
