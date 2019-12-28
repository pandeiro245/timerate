class CreateUserPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :user_people do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
