class Search
  def self.search(start_station_id, finish_station_id)
    bad_result = [{ train: nil, route: nil, start_station: nil, finish_station: nil, arrival_time: nil, departure_time: nil }]
    return bad_result if start_station_id == finish_station_id

    start_station = RailwayStation.find(start_station_id)
    finish_station = RailwayStation.find(finish_station_id)

    routes = Route.all.find_all do |route|
      start_station_index = route.railway_stations.ordered.find_index(start_station)
      route.railway_stations.ordered[(start_station_index + 1)..-1].include? finish_station unless start_station_index.nil?
    end

    result = if routes.present?
      routes.map do |route|
        route.trains.inject([]) do |hash, train|
          hash << { train_id: train.id, start_station_id: start_station.id, finish_station_id: finish_station.id, train: train.number, route: route.name, start_station: start_station.title, finish_station: finish_station.title, arrival_time: finish_station.arrival_time_in(route), departure_time: start_station.departure_time_in(route) }
        end
      end
    else
      bad_result
    end

    result.flatten
  end
end
