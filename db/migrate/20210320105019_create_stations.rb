class CreateStations < ActiveRecord::Migration[6.1]
  def change
    create_table :stations do |t|

    	t.string :station_name
    	t.integer :total_spaces_motorbikes
    	t.integer :total_spaces_bicycles
    	t.integer :total_spaces_motorcars

      t.timestamps
    end
  end
end
