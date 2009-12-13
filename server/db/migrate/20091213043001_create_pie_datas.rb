class CreatePieDatas < ActiveRecord::Migration
  def self.up
    create_table :pie_datas do |t|
      t.column :data_date, :date, :default => nil, :null => false
      t.column :data_type, :string, :default => nil, :null => false
      t.column :category, :string, :default => nil, :null => false
      t.column :data, :string, :default => nil, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :bar_datas
  end
end
