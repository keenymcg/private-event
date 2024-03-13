class EventGuestsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    
    def create
        # Logic to create a new attendance record
        @event = Event.find(params[:event_id])
        @event.attendees << current_user
        redirect_to @event, notice: 'Successfully attended the event.'
    end
    
    def destroy
        # Logic to cancel attendance
        @event_guest = EventGuest.find(params[:id]) # alt: current_user.event_guests.find_by(atteneded_event_id: params[:atteneded_event_id])
        @event_guest.destroy
        redirect_to @event, notice: 'You are no longer attending this event.'
    end
end
