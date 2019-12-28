class User < ApplicationRecord
  has_one :person
  has_secure_token :token
end
