class Item < ApplicationRecord
  belongs_to :brand
  has_one_attached :image_name
  
  default_scope -> { order(created_at: :desc) }
  
  validates :brand_id, presence: true
end
