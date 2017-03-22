class Train < ApplicationRecord
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  has_many :carriages

  delegate :economy_count, to: :carriages
  delegate :business_count, to: :carriages
  delegate :coupe_count, to: :carriages
  delegate :seat_count, to: :carriages
  delegate :economy, to: :carriages
  delegate :coupe, to: :carriages
  delegate :business, to: :carriages
  delegate :seat, to: :carriages
  delegate :top_seats, to: :carriages
  delegate :bottom_seats, to: :carriages
  delegate :side_top_seats, to: :carriages
  delegate :side_bottom_seats, to: :carriages
  delegate :seats, to: :carriages

  def seats_count(carriage_type, seats_type)
    carriages.where(type: carriage_type).sum(seats_type)
  end
end
