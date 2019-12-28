class Person < ApplicationRecord
  has_secure_token :token

  belongs_to :user, optional: true
  belongs_to :create_user, class_name: 'User', foreign_key: 'create_user_id'

  validates :name, presence: true

  def create_user_name
    'your inviter'
  end
end
