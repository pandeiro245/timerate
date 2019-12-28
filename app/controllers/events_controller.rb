class EventsController < ApplicationController
  def index
    @person = Person.new
    @events = Event.where(user: @current_user)
  end
end
