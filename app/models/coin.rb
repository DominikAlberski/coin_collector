class Coin < ApplicationRecord
  enum weight_category: {
    oz_1: 'oz_1',
    oz_1_2: 'oz_1_2',
    oz_1_4: 'oz_1_4',
    oz_1_10: 'oz_1_10',
    oz_1_20: 'oz_1_20'
  }

  validates :name, presence: true
  validates :weight_category, presence: true
  validates :weight, numericality: { greater_than: 0 }, allow_nil: true
end
