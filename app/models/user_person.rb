class UserPerson < ApplicationRecord
  belongs_to :user
  belongs_to :person
end
