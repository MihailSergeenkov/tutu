class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  validates :title, presence: true

  scope :ordered, -> { select('railway_stations.*, railway_stations_routes.position').joins(:railway_stations_routes).order('railway_stations_routes.position').distinct }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def update_time(route, arrival_time, departure_time)
    station_route = station_route(route)
    station_route.update(arrival_time: arrival_time, departure_time: departure_time) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def arrival_time_in(route)
    station_route = station_route(route)
    station_route.arrival_time.strftime('%H:%M') if station_route && station_route.arrival_time.present?
  end

  def departure_time_in(route)
    station_route = station_route(route)
    station_route.departure_time.strftime('%H:%M') if station_route && station_route.departure_time.present?
  end

  private

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
