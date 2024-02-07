class CreateCoins < ActiveRecord::Migration[7.1]
  def change
    create_table :coins do |t|
      t.string :name, null: false
      t.integer :release_year
      t.string :mint_name
      t.decimal :weight
      t.column :weight_category, :weight_category, null: false

      t.timestamps
    end
  end
end
