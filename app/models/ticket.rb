class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :finish_station, class_name: 'RailwayStation', foreign_key: :finish_station_id
  belongs_to :user

  scope :find_tickets, ->(user) { user.admin? ? all : where(user: user) }

  after_create :send_notification_about_buy_ticket
  after_destroy :send_notification_about_delete_ticket

  def route_name
    "#{start_station.title} - #{finish_station.title}"
  end

  private

  def send_notification_about_buy_ticket
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_notification_about_delete_ticket
    TicketsMailer.delete_ticket(self.user, self).deliver_now
  end
end
