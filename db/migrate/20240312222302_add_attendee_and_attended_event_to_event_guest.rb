class AddAttendeeAndAttendedEventToEventGuest < ActiveRecord::Migration[7.1]
  def change
    add_reference :event_guests, :attendee, foreign_key: { to_table: :users } 
    add_reference :event_guests, :attended_event, foreign_key: { to_table: :events }
  end
end
