class Event < ApplicationRecord
    # This model's attributes are: id, name, location, date, created_at, updated_at

    # Event can have many event_guests
    has_many :event_guests, foreign_key: :attended_event_id
    # Event can have many attendees through event_guests
    has_many :attendees, through: :event_guests, source: :attendee

    # Event can have one creator
    belongs_to :creator, class_name: 'User'

    def self.past
        where('date < ?', Date.today)
    end

    def self.upcoming
        where('date >= ?', Date.today)
    end
end
