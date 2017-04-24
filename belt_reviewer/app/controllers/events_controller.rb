class EventsController < ApplicationController
    
    def index
        @local_events = Event.where(state: current_user.state)
        @other_events = Event.where.not(state: current_user.state)
    end
    
    def show
        @event = Event.find(params[:id])
        @comments = Comment.where(event: params[:id])
    end
    
    def new
    end
    
    def create
        event = Event.new event_params
        event.user_id = current_user.id
        event.save
        unless event.save
            flash[:errors] = event.errors.full_messages
        end
        redirect_to "/events"
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
        @event = Event.find(params[:id])
        @event.destroy
         redirect_to "/events"
    end
    
    private
        def event_params
            params.require(:event).permit(:name, :date, :location, :state, :host)
        end
end
