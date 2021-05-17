class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :image
    validates :description 
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  

  with_options inclusion: { in: 2..47 } do
    validates :category_id
    validates :status_id
    validates :deliverry_charge_id 
    validates :area_id
    validates :day_id
  end
end

  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :area
    belongs_to :day
    belongs_to :category
    belongs_to :deliverry_charge
    belongs_to :status
end



