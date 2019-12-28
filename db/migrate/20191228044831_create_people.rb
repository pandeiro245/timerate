class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
