class CreateWeightCategoryEnum < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TYPE weight_category AS ENUM ('oz_1', 'oz_1_2', 'oz_1_4', 'oz_1_10', 'oz_1_20');
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE weight_category;
    SQL
  end
end
