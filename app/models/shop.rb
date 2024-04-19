class Shop < ApplicationRecord
  # Associations
  has_many :prices, dependent: :destroy
  has_many :coins, through: :prices

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true,
    format: { with: URI::regexp(%w[http https]), message: 'must be a valid URL' }
end
