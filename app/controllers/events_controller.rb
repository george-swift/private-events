class EventsController < ApplicationController
  before_action :logged_in_user, except: %i[index show]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @creator = Event.find(params[:id]).creator
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

  def logged_in_user
    store_location unless logged_in?
    flash[:danger] = 'Please log in to access this page' unless logged_in?
    redirect_to login_url unless logged_in?
  end
end
