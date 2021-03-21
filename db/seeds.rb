# seed record model with random data for each day 
# number of people with booked tickets for each day 
# number of cars and bikes in monitored parks to take an average percentage of people with cars bikes and motorbikes
# two years of sample data for each station
# hourly index of number of each type of vehicle


#  not so random data
# train schedule is fixed and must be set for each station
# number of parking spaces for car bike motorbike available at each station

stations = ["ShopVille-Zurich main ", "Bern station", "Basel SBB station", "Geneva Cornavin station", "Lucerne station", "Aarau station", "Baden station", "Bellinzona station", "Biel/Bienne station", "Brig station", "Chur station", "Delémont station", "Fribourg/Freiburg station", "Geneva Airport station", "Genève Eaux-Vives station", "Lausanne station", "Locarno station", "Lugano station", "Montreux station", "Neuchâtel station", "Olten station", "Schaffhausen station", "Sion station", "Solothurn station", "St. Gallen station", "Thun station", "Uster station", "Visp station", "Wil station", "Winterthur station", "Yverdon-les-Bains station", "Zug station", "Zurich Enge station", "Zurich Oerlikon station", "Zurich Stadelhofen station"]

stations.each_with_index do |s, idx|
	# rand(150)
	cars = rand(150..200)
	bikes = rand(20)
	motorbikes = rand(15)
	Station.create(station_name: s, total_spaces_motorbikes: motorbikes, total_spaces_motorcars: cars, total_spaces_bicycles: bikes)
	min_date = Date.today.prev_year
	puts s
	puts "first"

	for i in 0..8760
		tickets = rand(500)
		min_date = min_date.to_datetime + 1.hours
		# puts min_date
		Record.create(stations_id: idx + 1, hourly_index: min_date, booked_tickets: tickets, number_of_motorcars: rand(0..cars), number_of_bicycles: rand(0..bikes), number_of_motorbikes: rand(0..motorbikes))
		min_date.to_date
		# puts "i = " + i.to_s
	end
	puts	"second"
end


