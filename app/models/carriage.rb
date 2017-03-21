class Carriage < ApplicationRecord
  TYPES = ['Купейный', 'Плацкартный']

  belongs_to :train

  scope :econom, -> { where(type_carriage: 'Плацкартный') }
  scope :business, -> { where(type_carriage: 'Купейный') }
  scope :econom_count, -> { where(type_carriage: 'Плацкартный').count }
  scope :business_count, -> { where(type_carriage: 'Купейный').count }
  scope :econom_top_seats, -> { econom.sum(:top_seats) }
  scope :econom_bottom_seats, -> { econom.sum(:bottom_seats) }
  scope :business_top_seats, -> { business.sum(:top_seats) }
  scope :business_bottom_seats, -> { business.sum(:bottom_seats) }

  def types_select
    TYPES.map { |type| [type, type] }
  end
end
