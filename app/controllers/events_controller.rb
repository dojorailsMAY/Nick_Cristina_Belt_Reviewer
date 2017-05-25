class EventsController < ApplicationController
  def index
    @state_events = Event.where(state: current_user.state)
    @not_state_events = Event.where.not(state: current_user.state)
  end

  def create
    @event = Event.new event_params
    @event.user = current_user
    unless @event.save
      flash[:errors]= @event.errors.full_messages
    end
    redirect_to '/events'
  end

  def show
    @event = Event.includes(:user, :attending_users).find(params[:event_id])
    @messages = Message.includes(:user).where(event: @event)#you are grabbing the event from the variable assigned on line 17, the event for this message is the event you're showing.
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event.destroy
    redirect_to '/events'
  end

  def join
    @event = Event.find(params[:event_id]) #finding event by event id that is grabbed out of params, was passed in from form on line 49 in events/index.html.erb
    @event.attending_users << current_user # << adds the current user to the list of attending users in the event grabbed on line 26, this function is made possible by the has_many relationship on the model
    redirect_to '/events'

  end

  def leave
    @event = Event.find(params[:event_id])
    @attending = Attending.find_by(user:current_user, event:@event)
    @attending.destroy
    redirect_to '/events'
  end

  private
    def event_params
      params.require(:event).permit(:name, :location, :state, :date)
    end
end
