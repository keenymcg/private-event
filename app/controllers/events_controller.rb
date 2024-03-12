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
        @event = current_user.created_events.build(event_params)

        if @event.save
            redirect_to @event, notice: 'Event was successfully created.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
            redirect_to @event, notice: 'Event was successfully updated.'
        else
            render :edit
        end
    end
    
    private
        
    def event_params
        params.require(:event).permit(:name, :location, :date)
    end
end
