class Address < ApplicationRecord
  belongs_to :item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :region

end
