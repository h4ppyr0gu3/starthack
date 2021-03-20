class CreateParkings < ActiveRecord::Migration[6.1]
  def change
    create_table :parkings do |t|

    	t.string :station
    	t.integer :vehicle_type

      t.timestamps
    end
  end
end
