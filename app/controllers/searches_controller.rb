class SearchesController < ApplicationController
  before_action :set_railway_stations

  def show; end

  def create
    @results = Search.search(params[:start_station_id], params[:finish_station_id])
    render :show
  end

  private

  def set_railway_stations
    @railway_stations = RailwayStation.all
  end
end
