class Price < ApplicationRecord
  belongs_to :listing
  belongs_to :shop, through: :listing
  belongs_to :coin, through: :listing

  validates :price, presence: true, numericality: true
  validates :scraped_at, presence: true

  def formatted_price
    price / 100.0
  end
end
