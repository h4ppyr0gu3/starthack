class ParkingsController < ApplicationController
  before_action :set_parking, only: %i[ show edit update destroy ]
  # before_action :authenticate_user!

  

  def find_parking
    puts params
    redirect_to parking_availability_path
  end

  def parking
    @nuggies = "nuggies"
  end

  def choose

  end

end
