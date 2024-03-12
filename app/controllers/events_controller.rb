class EventsController < ApplicationController

    def index
        # @events = Event.all
        @events = current_user.events.build
    end
    
    def show
        @event = Event.find(params[:id])
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
        def create
            @event = current_user.events.build(event_params)
            if @event.save
                redirect_to @event, notice: 'Event was successfully created.'
            else
                render :new
            end
        end
        
        private
        
        def event_params
            params.require(:event).permit(:title, :description, :date)
        end
    end



end
