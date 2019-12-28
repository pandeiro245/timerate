class EventsController < ApplicationController
  def index
    session[:user_token] ||= params[:token] if params[:token]
    session[:user_token] ||= User.create.token
    current_user = User.find_by(token: session[:user_token])
    @people = Person.all
    @person = Person.new
    @events = Event.where(user: current_user)
  end
end
