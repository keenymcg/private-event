class EventGuest < ApplicationRecord
    # EventGuest belongs to a guest and an event.
    # EventGuest is a join table between User and Event.
    
    belongs_to :guest, class_name: 'User'
    belongs_to :event
end
