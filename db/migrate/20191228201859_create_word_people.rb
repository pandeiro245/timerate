class CreateWordPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :word_people do |t|
      t.belongs_to :word, null: false, foreign_key: true
      t.belongs_to :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
