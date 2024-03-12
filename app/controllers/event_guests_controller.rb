class EventGuestsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    
    def create
        # Logic to create a new attendance record
        @event_guest = EventGuest.new(event_guest_params)
        @event_guest.user = current_user

        if @event_guest.save
            # Success message or redirect to a success page
            redirect_to @event, notice: 'You are now attending this event.'
        else
            # Error handling code
            render :new, status: :unprocessable_entity
        end
    end
    
    def destroy
        # Logic to cancel attendance
        @event_guest = EventGuest.find(params[:id]) # alt: current_user.event_guests.find_by(atteneded_event_id: params[:atteneded_event_id])
        @event_guest.destroy
        redirect_to @event, notice: 'You are no longer attending this event.'
    end
end
