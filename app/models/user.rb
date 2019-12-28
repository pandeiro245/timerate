class User < ApplicationRecord
  has_secure_token :token
  has_one :person

  def name(user)
    Person.where(user_id: id).where(create_user_id: user.id).first.name
  end

  def from_me
    Person.where(
      create_user_id: id
    ).select do |person|
      person.user_id != id
    end
  end

  def to_me
    Person.where(user_id: id).where.not(
      create_user_id: id
    )
  end
end
