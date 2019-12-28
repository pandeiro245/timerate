class EventsController < ApplicationController
  def index
    if @current_user.blank?
      render html: 'no invitation'
    else
      redirect_to user_path(@current_user)
    end
  end
end
