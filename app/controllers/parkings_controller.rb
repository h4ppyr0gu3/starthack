class ParkingsController < ApplicationController
  before_action :set_parking, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  attr_reader :value

  

  def find_parking
    puts params
    b = ["ShopVille-Zurich main ", "Bern station", "Basel SBB station", "Geneva Cornavin station", "Lucerne station", "Aarau station", "Baden station", "Bellinzona station", "Biel/Bienne station", "Brig station", "Chur station", "Delémont station", "Fribourg/Freiburg station", "Geneva Airport station", "Genève Eaux-Vives station", "Lausanne station", "Locarno station", "Lugano station", "Montreux station", "Neuchâtel station", "Olten station", "Schaffhausen station", "Sion station", "Solothurn station", "St. Gallen station", "Thun station", "Uster station", "Visp station", "Wil station", "Winterthur station", "Yverdon-les-Bains station", "Zug station", "Zurich Enge station", "Zurich Oerlikon station", "Zurich Stadelhofen station"]
    c = 0
    @value = 0.00
    b.each_with_index do |s, idx|
      if s == params[:station]
        c = idx + 1
      end
    end
    year = params[:date].to_date.year
    month = params[:date].to_date.month
    day = params[:date].to_date.day
    hour = Time.parse(params[:hour]).hour
    a = RecordServices::CheckRecords.execute!(c, year, month, day, hour)
    if params[:vehicle_type] == "bicycle"
      @value = a[0]
    end
    if params[:vehicle_type] == "motorvehicle"
      @value = a[1]
    end
    if params[:vehicle_type] == "motorcycle"
      @value = a[2]
    end
    redirect_to parking_availability_path(value: @value)
  end

  def parking
    @nuggies = "nuggies"
    @value = params[:value]
    puts @value.to_f/100.round(4)
    @progress = @value.to_f/100.round(4)
  end

  def choose

  end

end
