class Bought
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :buy_id, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
  end
  
  with_options presence: true do
    validates :postal_code, format: { with: /\d{3}-\d{4}/ }  
    validates :city 
    validates :address
    validates :phone_number,format: { with: /\A\d{10,11}\z/ } 
    validates :token
  end
  
  validates :area_id, numericality: { other_than: 1 } 

  def save
    @buy = Buy.create(item_id: item_id, user_id: user_id)
    Delivery.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, buy_id: @buy.id)
  end
end