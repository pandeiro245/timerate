class Word < ApplicationRecord
  belongs_to :user
  has_many :word_people
  has_many :people, through: :word_people
end
