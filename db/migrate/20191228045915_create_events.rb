class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :person, null: false, foreign_key: true
      t.datetime :started_at
      t.datetime :stopped_at
      t.integer :duration
      t.float :rate
      t.float :limit

      t.timestamps
    end
  end
end
