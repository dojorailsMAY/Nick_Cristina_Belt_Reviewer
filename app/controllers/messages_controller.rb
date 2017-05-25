class MessagesController < ApplicationController
  def create
    @message = Message.new(user: current_user, content: params[:content], event: Event.find(params[:event_id]))
    @message.save
      redirect_to "/events/#{params[:event_id]}"
  end
end

# params[:event_id].to_s---->this is another way to type line 5
