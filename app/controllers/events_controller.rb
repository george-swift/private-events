class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    print "param from ev.show:"
    puts params
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Event successfully created'
      redirect_to @event
    else
      render :new
      flash[:danger] = 'Invalid event details'
    end
  end


  private

  def event_params
    params.require(:event).permit(:user_id, :name, :description, :date)
  end

end
