class EventGuest < ApplicationRecord
    belongs_to :guest, class_name: 'User'
    belongs_to :event
end
