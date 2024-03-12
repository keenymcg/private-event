class EventsController < ApplicationController

    def index
        @events = Event.all
        # alternative option from CoPilot: @events = current_user.events.build
    end
    
    # see another TOP student's code: https://github.com/Hadayxinchao/Private_Events/blob/main/app/controllers/events_controller.rb
    def show
        @event = Event.find(params[:id])
        # Do I need to redirect or render here?
    end

    def new
        @event = Event.new
    end

    def create
        # @event = Event.new(event_params)
        # @event.creator = current_user
        # if @event.save
        #     redirect_to @event
        # else
        #     render 'new'

        # end
        @event = current_user.created_events.build(event_params)

        if @event.save
            redirect_to @event, notice: 'Event was successfully created.'
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    private
        
    def event_params
        params.require(:event).permit(:name, :location, :date)
    end
end
