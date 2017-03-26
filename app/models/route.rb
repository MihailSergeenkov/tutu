class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :name, presence: true
  validate :stations_count

  before_validation :set_name

  private

  def set_name
    self.name = if self.persisted?
      "#{railway_stations.ordered.first.title} - #{railway_stations.ordered.last.title}" 
    else
      "#{railway_stations.first.title} - #{railway_stations.last.title}"
    end
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, 'Маршрут должен иметь как минимум две станции!')
    end
  end
end
