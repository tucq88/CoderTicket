class MyEventsController < ApplicationController
  before_action :require_user!

  # List of my events
  def index
    @events = current_user.events
  end

  # Create new event
  def new
    @event = Event.new(:user_id => current_user.id)
    @venues = Venue.all;
    @categories = Category.all;
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    @venues = Venue.all;
    @categories = Category.all;

    if @event.save
      flash[:success] = 'Your event published successfully.'
      redirect_to my_events_path
    else
      flash[:error] = 'Unable to create event.'
      render 'new'
    end

  end

  # Delete created event
  def destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :hero_image_url, :extended_html_description, :venue_id, :category_id, :starts_at, :ends_at)
    end

end
