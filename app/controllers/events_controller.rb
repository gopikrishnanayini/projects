class EventsController < ApplicationController
	def index
		@events = Event.all
	end
	def new
		@event = Event.new
	end
	def create
		@event = Event.new(event_params)
		respond_to do |format|
			if @event.save
				format.html { redirect_to @event, notice: 'Event was successfully created.'}
				format.json { render json:show}
			else
				format.html { render action:'new'}
				format.json { render json: @event.errors, :status => :unprocessable_entity}
			end
		end
	end
	def show
		@event = Event.find(params[:id])
	end
	def edit
		@event = Event.find(params[:id])
	end
    def update
    	@event = Event.find(params[:id])
    	respond_to do |format|
    		if @event.update(event_params)
    			format.html { redirect_to @event, notice: 'Event was successfully Updated.'}
    			format.json { render json: show}
    		else
    			format.html { render action: 'update'}
    			format.json { render json: @event.errors, :status => :unprocessable_entity}
    		end
    	end
    end
    def destroy
    	@event = Event.find(params[:id])
    	@event.destroy
    	redirect_to events_path
    end
	private
	def event_params
		params.require(:event).permit(:name, :age, :email, :comment)
	end
end
