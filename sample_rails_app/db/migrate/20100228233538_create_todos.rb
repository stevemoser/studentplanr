class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.string :name
      t.integer :user_id
      t.string :start_time
      t.string :end_time
      t.string :location
      t.string :calendar
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :todos
  end
end
