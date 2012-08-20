class DropOldTables < ActiveRecord::Migration
  def up
    drop_table :questions
    drop_table :answers
  end

  def down
  end
end
