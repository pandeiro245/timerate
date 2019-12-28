module ApplicationHelper
  def to_me_link(person)
    name = person.create_user.names_str
    if person.create_user_id.present?
      link_to name, user_path(person.create_user)
    else
      name
    end
  end

  def from_me_link(person)
    if person.user_id.present?
      link_to person.name, user_path(person.user)
    else
      link_to person.name, person_path(person)
    end
  end
end
