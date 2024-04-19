class CreatePrices < ActiveRecord::Migration[7.1]
  def change
    create_table :prices do |t|
      t.references :listing, null: false, foreign_key: true
      t.integer :price
      t.datetime :scraped_at

      t.timestamps
    end
  end
end
