class Listing < ApplicationRecord
  belongs_to :coin
  belongs_to :shop
end
