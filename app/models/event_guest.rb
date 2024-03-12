class EventGuest < ApplicationRecord
    # EventGuest belongs to a guest and an event.
    # EventGuest is a join table between User and Event.
    
    # attendee is the id of a user that is attending an event.
    belongs_to :attendee, class_name: 'User'

    # attended_event is the id for an event that has attendees.
    belongs_to :attended_event, class_name: 'Event'
end
