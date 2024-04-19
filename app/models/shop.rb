class Shop < ApplicationRecord
  # Associations
  has_many :listings
  has_many :coins, through: :listings
  has_many :prices, through: :listings, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true,
    format: { with: URI::regexp(%w[http https]), message: 'must be a valid URL' }
end
