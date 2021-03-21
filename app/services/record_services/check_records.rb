module RecordServices
	class CheckRecords
		class << self

			def execute! station_id, year, month, day, hour
				search_3_hour_leeway(station_id, year, month, day, hour)
			end

			def search_3_hour_leeway station_id, year, month, day, hour
				a = Record.where(stations_id: station_id)
				expected_date = DateTime.new(year, month, day, hour)
				one_year_ago = expected_date.prev_year
				time_index = DateTime.new()
				same_date = []

				for i in 0..3
					date = one_year_ago - i.hours
					same_date << a.find_by(hourly_index: date)
				end

				for i in 1..3
					date = one_year_ago + i.hours
					same_date << a.find_by(hourly_index: date)
				end

				for i in 1..5
					date = one_year_ago.prev_day(7 * i)
					same_date << a.find_by(hourly_index: date)
				end
				b = Station.find_by(id: station_id)
				count = 0			
				motorbike_total = 0
				motorcars_total = 0
				bicycle_total = 0

				same_date.compact.each do |s|
					# puts s.number_of_motorbikes.to_i 
					motorbike_total += s.number_of_motorbikes.to_i 
					motorcars_total += s.number_of_motorcars.to_i 
					bicycle_total += s.number_of_bicycles.to_i 
					count += 1
				end
				
				b = Station.find_by(id: station_id)

				puts b.total_spaces_motorbikes

				motorbike_percentage =  (motorbike_total.to_f / (b.total_spaces_motorbikes.to_i * count).to_f) * 100
				motorcars_percentage = (motorcars_total.to_f / (b.total_spaces_motorcars.to_i * count).to_f) * 100
				bicycles_percentage = (bicycle_total.to_f / (b.total_spaces_bicycles.to_i * count).to_f) * 100
				return bicycles_percentage, motorcars_percentage, motorbike_percentage
				# count
			end
		end
	end
end