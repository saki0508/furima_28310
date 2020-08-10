class Address < ApplicationRecord
  belongs_to :item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :region

  validates :postal_code, :prefecture_id, :city, :block, :phone_number, presence: true

  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ , message: "Input correctly"}
  validates :phone_number, format: { with: /\A\d{11}\z/ }

  #選択が「--」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_than: 1, message: "Select"} 

  

end
