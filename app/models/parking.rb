class Parking < ApplicationRecord
	belongs_to :users

	enum vehicle_type: [ :motorcycle, :bicycle, :motorvehicle]
	
end
