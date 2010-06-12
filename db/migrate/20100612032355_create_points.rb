class CreatePoints < ActiveRecord::Migration
  def self.up
    create_table :points do |t|
      t.float :latitude 
      t.float :longitude
      t.string :title
      t.integer :moment

      t.timestamps
    end
  end

  def self.down
    drop_table :points
  end
end
