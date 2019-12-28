class EventsController < ApplicationController
  def index
    current_user = nil
    if current_user.present?
      @events = Event.where(user: current_user)
    else
      render html: 'this service is invaited only.'
    end
  end
end
