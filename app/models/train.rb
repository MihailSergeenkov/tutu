class Train < ApplicationRecord
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  has_many :carriages

  delegate :econom_count, to: :carriages
  delegate :business_count, to: :carriages
  delegate :business_bottom_seats, to: :carriages
  delegate :business_top_seats, to: :carriages
  delegate :econom_bottom_seats, to: :carriages
  delegate :econom_top_seats, to: :carriages
end
