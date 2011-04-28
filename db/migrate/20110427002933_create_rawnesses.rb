class CreateRawnesses < ActiveRecord::Migration
  def self.up
    create_table :rawnesses do |t|
      t.string :department
      t.integer :year
      t.decimal :money

      t.timestamps
    end
  end

  def self.down
    drop_table :rawnesses
  end
end
