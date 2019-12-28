class User < ApplicationRecord
  has_secure_token :token
  has_one :person
  has_many :words

  def self.clean
    self.all.each do |user|
      user.clean
    end
  end

  def merge(user_id)
    user = User.find(user_id)
    Person.where(user_id: user_id).update_all(user_id: id)
    Person.where(create_user_id: user_id).update_all(create_user_id: id)
    user.delete
  end

  def person_name
    # for form
  end

  def invited?(user)
    inviteds.present?
  end

  def inviteds
    from_me.select{|person| person.user_id.blank?}
  end

  def not_inviteds
    from_me.select{|person| person.user_id.blank?}
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
