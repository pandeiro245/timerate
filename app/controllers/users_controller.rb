class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @person = Person.new
    @word   = Word.new
  end
end
