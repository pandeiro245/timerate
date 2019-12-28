class PeopleController < ApplicationController
  def create
    @person = Person.new(person_params)
    @person.create_user_id = current_user.id
    if @person.save
      redirect_to :root, notice: 'person was created.'
    end
  end

  private
    def person_params
      params.require(:person).permit(:name)
    end
end
