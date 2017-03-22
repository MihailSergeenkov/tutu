class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, presence: true

  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :coupe, -> { where(type: 'CoupeCarriage') }
  scope :business, -> { where(type: 'BusinessCarriage') }
  scope :seat, -> { where(type: 'SeatCarriage') }
  scope :economy_count, -> { economy.count }
  scope :coupe_count, -> { coupe.count }
  scope :business_count, -> { business.count }
  scope :seat_count, -> { seat.count }
  scope :top_seats, -> { sum(:top_seats) }
  scope :bottom_seats, -> { sum(:bottom_seats) }
  scope :side_top_seats, -> { sum(:side_top_seats) }
  scope :side_bottom_seats, -> { sum(:side_bottom_seats) }
  scope :seats, -> { sum(:seats) }

  def self.types
    Rails.application.eager_load!
    Carriage.descendants
  end

  def types_select
    Carriage.types.map { |type| [type.to_s, type.to_s] }
  end
end
