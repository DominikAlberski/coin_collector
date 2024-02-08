class AddTriggerWeightToCoins < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE OR REPLACE FUNCTION set_coin_weight()
      RETURNS TRIGGER AS $$
      BEGIN
        IF NEW.weight IS NULL AND NEW.weight_category != 'other' THEN
          CASE NEW.weight_category
            WHEN 'oz_1' THEN NEW.weight := 31.1035;
            WHEN 'oz_1_2' THEN NEW.weight := 31.1035 / 2;
            WHEN 'oz_1_4' THEN NEW.weight := 31.1035 / 4;
            WHEN 'oz_1_10' THEN NEW.weight := 31.1035 / 10;
            WHEN 'oz_1_20' THEN NEW.weight := 31.1035 / 20;
            -- No action for 'other', allowing weight to be NULL or set by the user
          END CASE;
        END IF;
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;
    SQL
    execute <<-SQL
      CREATE TRIGGER set_coin_weight_before_insert_or_update
      BEFORE INSERT OR UPDATE
      ON coins
      FOR EACH ROW
      EXECUTE FUNCTION set_coin_weight();
    SQL
  end

  def down
    execute "DROP TRIGGER IF EXISTS set_coin_weight_before_insert_or_update ON coins;"
    execute "DROP FUNCTION IF EXISTS set_coin_weight();"
  end
end
