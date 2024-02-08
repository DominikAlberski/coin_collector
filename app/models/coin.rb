# == Schema Information
#
# (Schema info will be automatically added by the annotate gem)
#
# PostgreSQL Trigger:
#  A trigger is set up in the database to automatically set the weight of a coin based on its weight_category before insert or update.
#  For coins with a weight_category other than 'other', the trigger calculates the weight in grams using predefined values.
#  If the weight_category is 'other', the weight can be NULL or set directly, allowing for flexibility with non-standard coins.
#  Note: The ActiveRecord object for a coin will not reflect the updated weight set by the trigger until reloaded (coin.reload).
# TROY_OUNCE = 31.1035
#
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
