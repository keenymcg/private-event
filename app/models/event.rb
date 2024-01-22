class Event < ApplicationRecord

    # Event can have many guests
    has_many :event_guests, foreign_key: :attended_event_id
    
    # Event can have many attendees through event_guests
    has_many :attendees, through: :event_guests, source: :guest

    # Event can have one creator
    belongs_to :creator, class_name: 'User'
end
