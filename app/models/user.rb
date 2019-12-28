class User < ApplicationRecord
  has_secure_token :token
  has_one :person

  def self.clean
    self.all.each do |user|
      user.clean
    end
  end
  
  def clean
    self.delete if from_me.blank?
  end

  def names_str
    to_me.map{|person| person.name}.join(',')
  end

  def name(user)
    return 'YOU' if id == user.id
    person = Person.where(user_id: id).where(create_user_id: user.id).first
    person.try(:name) || 'noname'
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
