class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @person = Person.new
  end
end
