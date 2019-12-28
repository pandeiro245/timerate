class UtilsController < ApplicationController
  def import
    JSON.parse(params[:data]).each do |table_name, items|
      table_name = 'event' if table_name == 'events'
      model_name = table_name.singularize.camelcase
      model = eval(model_name)
      items.each do |item|
        instance = model.new
        item.each do |key, val|
          next if table_name == 'users' && key == 'name'
          instance.send("#{key}=", val)
        end
        instance.save!
      end
    end
    render json: 'ok'
  end

  def export
    data = {
      users: User.all,
      people: Person.all,
      events: Event.all
    }
    render json: data
  end
end
