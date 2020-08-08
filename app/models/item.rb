class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :shipping_date 

  #空の投稿を保存できないようにする
  validates :name, :description, :image, :price, :category, :state, :postage, :region, :shipping_date, presence: true

  #選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "Select"} 
  validates :state_id, numericality: { other_than: 1, message: "Select" } 
  validates :postage_id, numericality: { other_than: 1, message: "Select" } 
  validates :region_id, numericality: { other_than: 1, message: "Select" } 
  validates :shipping_date_id, numericality: { other_than: 1, message: "Select" } 

  validates :price, :numericality => { greater_than_or_equal_to: 300, message: "Out of setting range" } 
  validates :price, :numericality => { less_than_or_equal_to: 9999999, message: "Out of setting range" } 
end
