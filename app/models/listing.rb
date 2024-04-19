class Listing < ApplicationRecord
  belongs_to :coin
  belongs_to :shop
  has_many :prices, dependent: :destroy
end
