class Brand < ApplicationRecord
     
     has_one_attached :image_name
     
     validates :name, presence: true
     validates :explain, presence: true
end
