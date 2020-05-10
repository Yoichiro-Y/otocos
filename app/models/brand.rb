class Brand < ApplicationRecord
     
     has_one_attached :image_name
     has_many :products
     
     validates :name, presence: true
     validates :explain, presence: true
end
