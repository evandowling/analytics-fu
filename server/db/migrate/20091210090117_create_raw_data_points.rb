class CreateRawDataPoints < ActiveRecord::Migration
  def self.up
    create_table :raw_data_points do |t|
      t.column :user_id, :integer, :default => nil, :null => false
      t.column :data, :text, :default => nil, :null => true
      t.timestamps
    end
  end

  def self.down
    drop_table :raw_data_points
  end
end
