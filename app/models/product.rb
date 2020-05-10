class Product < ApplicationRecord
    
    has_one_attached :image_name
    belongs_to :brand
    has_many :microposts
     
    validates :name, presence: true
    validates :explain, presence: true
     
end
