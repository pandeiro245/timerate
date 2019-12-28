class ApplicationController < ActionController::Base
  before_action :commons

  def commons
    if params[:person_token].present?
      person = Person.find_by(token: params[:person_token])
      if person.present?
        if person.user.blank?
          if session[:user_id].present?
            person.user = User.find_by(id: session[:user_id])
          end
          if person.user.blank?
            person.user = User.create!
          end
        end
        @current_user = person.user
        person.save!
      end
    end


    if params[:user_token].present?
      @current_user = User.find_by(token: params[:user_token])
      session[:user_id] ||= @current_user.id
    end

    @current_user ||= User.find_by(id: session[:user_id])


    if @current_user.blank? && User.count == 0
      @current_user = User.create 
    end

    session[:user_id] = @current_user.id if @current_user.present?
  end
end
