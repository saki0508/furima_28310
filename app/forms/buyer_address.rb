class BuyerAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id,:token


  validates :postal_code, :prefecture_id, :city, :block, :phone_number, presence: true

  post_code = /\A\d{3}[-]\d{4}\z/
  phone_code = /\A\d{10,11}\z/

  validates :postal_code, format: { with: post_code , message: "Input correctly"}
  validates :phone_number, format: { with: phone_code }

  validates :prefecture_id, numericality: { other_than: 1, message: "Select"} 

  def save
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, item_id: item_id)
    Buyer.create(user_id: user_id, item_id: item_id)
  end

end