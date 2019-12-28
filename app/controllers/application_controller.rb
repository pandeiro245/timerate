class ApplicationController < ActionController::Base
  before_action :commons

  def commons
    session[:user_token] ||= params[:token] if params[:token]
    session[:user_token] ||= User.create.token
    @current_user = User.find_by(token: session[:user_token])
    if @current_user.blank?
      @current_user = User.create
      session[:user_token] = @current_user.token
    end

    if params[:person_token].present?
      person = Person.find_by(token: params[:person_token])
      person.user = @current_user
      person.save!
    end
  end
end
