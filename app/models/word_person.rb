class WordPerson < ApplicationRecord
  belongs_to :word
  belongs_to :person
end
