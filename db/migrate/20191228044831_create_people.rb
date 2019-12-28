class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :token
      t.belongs_to :user, foreign_key: true
      t.integer :create_user_id, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
