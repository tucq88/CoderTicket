class EventsController < ApplicationController
  def index
    @events = Event.future
  end

  def show
    @event = Event.find(params[:id])
  end
end
