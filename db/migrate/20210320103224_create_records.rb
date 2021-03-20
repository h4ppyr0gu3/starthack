class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|

    	t.integer :booked_tickets
    	t.integer :number_of_motorcars
    	t.integer :number_of_motorbikes
    	t.integer :number_of_bicycles
    	t.datetime :hourly_index
      t.references :stations
    	
      t.timestamps
    end
  end
end
